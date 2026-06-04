output "lambda_payload_forwarder_arn" {
  value = module.lambda_payload_forwarder.lambda_function_arn
}

output "lambda_payload_forwarder_name" {
  value = module.lambda_payload_forwarder.lambda_function_name
}

output "sns_topic_id" {
  value = aws_sns_topic.notification_receiver.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.notification_receiver.arn
}
