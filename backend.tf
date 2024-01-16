terraform {
  
  backend "s3" {
    bucket = "tf-test-backend-bucket"
    encrypt = true 
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}