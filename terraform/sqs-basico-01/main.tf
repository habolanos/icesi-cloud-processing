# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "aws-icesi-2023"
}

resource "aws_sqs_queue" "basico-01_queue" {
  name                      = "basico-01-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "lab"
  }
}