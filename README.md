# Terraform AWS Cost Anomaly Detection ![](https://img.shields.io/github/actions/workflow/status/wearetechnative/terraform-aws-module-cost-anomaly-detection/tflint.yaml?branch=main&style=plastic)

<!-- SHIELDS -->
This Terraform module configures AWS Cost Anomaly Detection and forwards cost anomaly events through [EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-events.html), SNS, and Lambda to an SQS queue.

## Requirements

This module must be deployed:

1. In `us-east-1`.
2. Only in AWS management accounts.

Cost Anomaly Detection is managed through the payer/management account, so deploying this module in member accounts is not supported.

[![](we-are-technative.png)](https://www.technative.nl)

## Usage

Configure the AWS provider for `us-east-1` in the root module and pass that provider to this module.

```hcl
provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

module "cost_anomaly_detection" {
  source = "git@github.com:TechNative-B-V/terraform-aws-module-cost-anomaly-detection.git?ref=v0.0.1"

  providers = {
    aws = aws.use1
  }

  monitoring_account_configuration = {
    sqs_name    = string
    sqs_region  = string
    sqs_account = number
  }

  sqs_dlq_arn = string
  kms_key_arn = string
}
```
