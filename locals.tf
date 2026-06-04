locals {
  
  lambda_payload_forwarder = "cost-anomaly_forwarder"

  monitoring_account_sqs_arn = "arn:aws:sqs:${var.monitoring_account_configuration.sqs_region}:${var.monitoring_account_configuration.sqs_account}:${var.monitoring_account_configuration.sqs_name}"
  monitoring_account_sqs_url = "https://sqs.${var.monitoring_account_configuration.sqs_region}.amazonaws.com/${var.monitoring_account_configuration.sqs_account}/${var.monitoring_account_configuration.sqs_name}"

  default_eventbridge_rules = {
    "cost_anomaly_rule": {
      "event_pattern": jsonencode({
        "source": ["aws.ce"],
        "detail-type": ["Anomaly Detected"],
      })
      "description": "Detects cost anomaly events"
      "state": "ENABLED"
    }
  }
}
