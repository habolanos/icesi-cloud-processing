# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "aws-icesi-2023"
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_model
resource "aws_sagemaker_model" "sagemaker-model-basico-01" {
  name               = "sagemaker-model-basico-01"
  execution_role_arn = aws_iam_role.example.arn

  primary_container {
    image = data.aws_sagemaker_prebuilt_ecr_image.test.registry_path
  }
}

resource "aws_iam_role" "iam-role-sagemaker" {
  assume_role_policy = data.aws_iam_policy_document.policy-document-sagemaker-assume-role.json
}

data "aws_iam_policy_document" "policy-document-sagemaker-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

data "aws_sagemaker_prebuilt_ecr_image" "test" {
  repository_name = "kmeans"
}