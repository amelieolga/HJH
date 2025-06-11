output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "public_vm_public_ip" {
  description = "Public IP address of the public VM"
  value       = aws_instance.public_vm.public_ip
}

output "private_vm_private_ip" {
  description = "Private IP address of the private VM"
  value       = aws_instance.private_vm.private_ip
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.web.dns_name
}

output "assets_bucket_name" {
  description = "Name of the assets S3 bucket"
  value       = aws_s3_bucket.assets.bucket
}

output "ec2_instance_role_arn" {
  description = "ARN of the IAM role created for EC2 instances"
  value       = aws_iam_role.ec2_instance_role.arn
}

output "s3_access_policy_arn" {
  description = "ARN of the S3 assets access policy"
  value       = aws_iam_policy.s3_assets_access.arn
}