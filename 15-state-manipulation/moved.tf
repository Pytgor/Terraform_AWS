moved {
  from = aws_instance.indexzero[0] # This changethe name of my ec2 from indexzerp to "instance1"
  to   = aws_instance.indexzero["instance1"]

}

moved {
  from = aws_instance.indexzero[1]
  to   = aws_instance.indexzero["instance2"]

}

moved {
  from = aws_instance.indexzero["instance1"] # This changethe name of my ec2 from indexzerp to "instance1"
  to   = aws_instance.new_final

}

moved {
  from = aws_instance.indexzero["instance2"]
  to   = module.compute.aws_instance.this

}
