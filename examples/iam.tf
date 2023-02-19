module "example" {
  source = "git@github.com:frederik-schwarz/IAM.git?ref=0.2.7"

  create_iam_group = true
  iam_group_config = {
    name = "example"
    path = "/"
  }

  create_iam_policy_document = true
  iam_policy_assume_document_config = {
    statement = [{
      actions = ["sts:AssumeRole"]
      principals = [{
        identifiers = ["firehose.amazonaws.com"]
        type = "Service"
      }]
    }]
  } 

  create_iam_role = true
  iam_role_config = {
    name = "example"
    assume_role_policy = module.example.iam_policy_assume_document_json
  }

  create_iam_policy = true
  iam_policy_config = {
    name = "example"
    policy = data.aws_iam_policy_document.bucket_policy.json
  }

  create_iam_role_policy_attachment = true
  iam_role_policy_attachment = {
    role = module.example.iam_role_name
    policy_arn = module.example.iam_policy_arn
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid       = "AllowFullS3Access"
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["*"]
  }
}
