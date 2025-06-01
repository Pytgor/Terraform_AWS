A networking module that should:
1. [DONE] Cretae a vpc with a given CIDR blcok 
2. Allow the user to provide the configureation for multiple subnets:
    2.1 [DONE] The user should be able to mark a subnet as public or private
    2.2 [DONE] The user should be able to provide AWS azs
    2.3 The user should be able to provide CIDR blocks
        2.3.1 If at least one subnet is public, we need to deploy an IGW
        2.3.2 We need to associate the public subnets with a public RTB