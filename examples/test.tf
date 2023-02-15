module "test" {
  source = "git@github.com:frederik-schwarz/IAM.git?ref=0.1.3"

  create_iam_group = true
  iam_group_config = {
    name = "example"
    path = "/"
  }

  create_iam_policy_document = true
  iam_policy_document_config = {
    statement = [{
      actions = ["sts:AssumeRole"]
      principals = [{
        identifiers = ["firehose.amazonaws.com"]
        type = "Service"
      }]
    }]
  } 

  create_iam_policy = true
  iam_policy_config = {
    name = "test"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ec2:Describe*"]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })

  }
}
