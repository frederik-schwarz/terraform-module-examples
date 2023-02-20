module "example_ec2" {
  source = "git@github.com:frederik-schwarz/ec2.git?ref=0.1.1"

  create_aws_instance = true
  aws_instance = {
    ami = data.aws_ami.image.id

    tags = {
        "value" = "example"
    }
  }
}
