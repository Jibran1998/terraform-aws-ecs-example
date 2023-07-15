variable "app_name" {
  default = "Name of the app to deploy"
}

variable "app_count" {
  type = number
  default = 1
}

variable "image" {
  description = "Image to deploy in ECS"
}

variable "container_port" {
  description = "container port"
}

variable "aws_access_key" {
  description = "aws access key variable"
}

variable "aws_secret_key" {
  description = "aws secret key variable"
}

variable "aws_region" {
  default = "us-east-2"
  description = "aws region"
}