variable "sgss" {
  type = list(string)
  default = [ "80", "443", "8080", "9000" ]
}

variable "vpc_id" {
  
}

variable "sg_name" {
    type = string
   default = "my-test-sg"
}


variable "sffg" {
  type = list(string)
  default = [ "9985", "2224", "5565", "2245" ]
}

