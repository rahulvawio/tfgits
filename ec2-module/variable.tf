variable "ami" {
    type = string
    default = "ami-0c42696027a8ede58"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "tags" {
    type = map(string)

    default = {
      Name = "Hello"
    }
  
}