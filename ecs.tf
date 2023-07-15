resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.app_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = <<DEFINITION
[
  {
    "image": "${var.image}",
    "cpu": 1024,
    "memory": 2048,
    "name": "${var.app_name}",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.container_port},
        "hostPort": ${var.container_port}
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_cluster" "app_cluster" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_service" "app_ecs_service" {
  name            = var.app_name
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.app_sg.id]
    subnets         = aws_subnet.private.*.id
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app_target_grpup.id
    container_name   = var.app_name
    container_port   = var.container_port
  }

  depends_on = [aws_lb_listener.app_alb_listener]
}