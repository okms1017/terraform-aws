output "first_arn" {
  value       = aws_iam_user.iam[0].arn
  description = "The ARN for the first user"
}

output "all_arns" {
  value       = aws_iam_user.iam[*].arn
  description = "The ARNs for all users"
}