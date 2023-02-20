locals {
  image_name = "image-id"
  image_values = ["ami-0692dea0a2f8a1b35"]
  virtulization_name = "virtualization-type"
  virtulization_values = ["hvm"] 
}

data "aws_ami" "image" {
  most_recent = true

  filter {
    name = local.image_name
    values = local.image_values
  }

  filter {
    name = local.virtulization_name
    values = local.virtulization_values
  }
}