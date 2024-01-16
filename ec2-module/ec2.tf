resource "aws_instance" "sed" {
  ami           = var.ami
  instance_type = var.instance_type
    provisioner "local-exec" {
    command = "echo ${self.private_ip} > file.txt"
    when = destroy
  }
  tags = var.tags
}


