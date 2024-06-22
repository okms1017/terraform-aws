resource "aws_security_group" "seong_ec2_sg" {
  vpc_id      = aws_vpc.seong_vpc.id
  name        = "seong-ec2-sg"
  description = "seong-ec2-sg"
}

resource "aws_security_group_rule" "seong_sg_inbound" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.seong_ec2_sg.id
}

resource "aws_security_group_rule" "seong_sg_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.seong_ec2_sg.id
}

output "aws_security_group_id" {
  value = aws_security_group.seong_ec2_sg.id
}