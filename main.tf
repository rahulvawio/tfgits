provider "aws" {
  region     = "ap-south-1"
}

module "ec2_instance" {
  source      = "./ec2-module"
  instance_type = var.instances_type
  ami = var.ami
  


  
  tags = {
    Name = "ken"
  }
  }

resource "null_resource" "ksd" {
}

resource "aws_s3_bucket" "tesst_bkt" {
  bucket = "dependontest"
  depends_on = [ module.ec2_instance ]
  tags = {
    Name        = "dependtest"
    Environment = "Dev"
  }
}

module "vpcs" {
  source = "./Vpc-mod"
}
module "securitys" {
  source = "./sg-module"
  vpc_id = module.vpcs.vpc_id
}


resource "null_resource" "null2" {
      provisioner "local-exec" {
      command = "ping -n 10 google.com"
      when = destroy

  }
  
}


/*
module "ecs-clust" {
  source = "./ecs-cluster"
}

module "ec2-def" {
  source = "./ecs_task_def"
}

module "ecs_serv" {
  source = "./ecs-module"
  task_definition = module.ec2-def.ecs_task_ot
  ecs_clust_id = module.ecs-clust.ecs_clust_id

}
*/