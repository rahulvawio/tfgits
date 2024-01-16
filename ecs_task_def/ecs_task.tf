resource "aws_ecs_task_definition" "service" {
  family = "mytsk"
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  cpu       = 256
  memory    = 512
  container_definitions = jsonencode([   
{
    "name": "Blue-container",
    "image": "nginx:latest",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp"
      }
    ]
   }
  ]
)
}