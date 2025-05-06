output "vpc_id" {
    value = aws_vpc.main.id
  
}

output "public_subnets_ids" {
    value = aws_subnet.public[*].id
  
}

output "private_subnet_ids" {
  description = "List of private subnet IDs from VPC"
  value       = aws_subnet.private[*].id
}
