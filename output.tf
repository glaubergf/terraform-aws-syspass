/*
output "public_ip" {
  description = "Contains the public IP address"
  value = aws_instance.server.public_ip
}

output "public_dns" {
  description = "Public DNS associated with the dynamic IP address"
  value = aws_instance.server.public_dns
}
*/

output "instance_id" {
  description = "ID of identify of instance"
  value       = aws_instance.server.id
}

output "instance_type" {
  description = "Type of instance to create"
  value       = aws_instance.server.instance_type
}

output "public_ip" {
  description = "Contains the public static IP address"
  value       = aws_eip.eip-us-east-1.public_ip
}

output "public_dns" {
  description = "Public DNS associated with the Elastic IP address"
  value       = aws_eip.eip-us-east-1.public_dns
}