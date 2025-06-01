

locals {
  roles_policies = {
    readonly = [
      "ReadOnlyAccess"
    ]
    auditor = [
      "SecurityAudit"
    ]
    admin = [
      "AdministratorAccess"
    ]

    developer = [
      "AmazonVPCFullAccess",
      "AmazonEC2FullAccess",
      "AmazonRDSFullAccess"
    ]
  }

  role_policies_list = flatten([
    for role, policies in local.roles_policies : [
      for policy in policies : {
        role   = role
        policy = policy
      }
    ]
  ])

}

output "policies" {
  value = local.role_policies_list

}



data "aws_caller_identity" "current" {}

/*
1- We must interate over ther exissting roles and  create a different assume role policy  for each of them 
2- In each role policy, under indetifiers add only users that have that specific listed.

*/

data "aws_iam_policy_document" "assume_role_policy" {
  for_each = toset(keys(local.roles_policies))

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [
        for username in keys(aws_iam_user.users) : "arn:aws:iam::${data.aws_caller_identity.current.account_id}user/${username}"
        if contains(local.users_map[username], each.value)
      ]
    }
  }

}



resource "aws_iam_role" "roles" {
  for_each           = toset(keys(local.roles_policies))
  name               = each.key
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.value].json
}

data "aws_iam_policy" "managed_policies" {

  for_each = toset(local.role_policies_list[*].policy)
  arn      = "arn:aws:iam::aws:policy/${each.value}"
}

resource "aws_iam_role_policy_attachment" "role_policy_attachments" {
  count      = length(local.role_policies_list)
  role       = aws_iam_role.roles[local.role_policies_list[count.index].role].name
  policy_arn = data.aws_iam_policy.managed_policies[local.role_policies_list[count.index].policy].arn

}