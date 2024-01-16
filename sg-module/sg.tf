resource "aws_security_group" "test-sg" {
  name        = var.sg_name
  vpc_id      = var.vpc_id

  dynamic "ingress" {
  for_each =  var.sgss
  iterator = ports
  content {
    description      = "TLS from VPC"
    from_port        = ports.value
    to_port          = ports.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
   }
  }

   dynamic "ingress" {
  for_each =  var.sffg
  iterator = ports
  content {
    description      = "TLS from VPC"
    from_port        = ports.value
    to_port          = ports.value
    protocol         = "tcp"
    cidr_blocks      = ["10.1.0.0/16"] 
   }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags = {
    Name = "test-sg"
  }
}