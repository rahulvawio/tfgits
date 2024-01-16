variable "tag" {
  description = "A map of tags to apply to the EC2 instance."
  type        = map(string)
  default     = {
    Name = "Rahul454"
  }
}
variable "instances_type" {
  type = string
  default = "t2.micro"
}
variable "ami" {
  type = string
  default = "ami-0c42696027a8ede58"
}

variable "Env" {
  type = string
  default = "dev"
}

variable "prod_Val" {
  default = 4
}

variable "nonprod_Val" {
  default = 1
}
variable "nbs" {
  type = list(string)
  default = [ "build1" , "build2", "build3" ]
  
}