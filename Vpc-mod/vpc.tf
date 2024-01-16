resource "aws_vpc" "main" {
  cidr_block       = var.cider

  tags = {
    Name = var.tg
  }
}