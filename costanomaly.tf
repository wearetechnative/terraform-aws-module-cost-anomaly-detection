resource "aws_ce_anomaly_monitor" "cost_anomaly" {
  name              = "AwsLinkedAccountMonitor"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "LINKED_ACCOUNT"
}

resource "aws_cloudwatch_event_rule" "console" {
  name        = "cost-anomaly-detected"
  description = "Detects cost anomaly events"

  event_pattern = jsonencode({
    source        = ["aws.ce"]
    "detail-type" = ["Anomaly Detected"]
  })
}


