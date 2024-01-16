resource "aws_ecs_service" "ecs_service" {
 name            = "ecs-clust"
 cluster         = var.ecs_clust_id
 task_definition = var.task_definition
 desired_count   = 1

 network_configuration {
   subnets         = ["subnet-08315e30e72853446"]
   security_groups = ["sg-05130d8a52415e40c"]
 }

 force_new_deployment = true
 placement_constraints {
   type = "distinctInstance"
 }

 triggers = {
   redeployment = timestamp()
 }
}