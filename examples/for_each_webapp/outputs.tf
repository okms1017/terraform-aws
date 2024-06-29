output "public_dns_name" {
  description = "Public DNS name of load balancer"
  value       = { for p in sort(keys(var.project)) : p => module.elb_http[p].elb_dns_name }
}

output "vpc_arn" {
  description = "ARN of the vpc"
  value       = { for p in sort(keys(var.project)) : p => module.vpc[p].vpc_arn }
}

output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = { for p in sort(keys(var.project)) : p => module.ec2_instances[p].instance_ids }
}