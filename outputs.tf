output "setup_status" {
  value       = "Base configuration loaded successfully!"
  description = "Confirms that Terraform loaded correctly before resource creation."
}

output "ec2_public_ip" {
  value       = module.ec2.public_ips
  description = "Public IP address of the WordPress EC2 instance"
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}
