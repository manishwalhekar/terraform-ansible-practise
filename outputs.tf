output "instance_ip_addr" {
  value       = [
    for instance in aws_instance.my_instance : instance.public_ip
  ]
  description = "public ip of all 4 instance"
}