output "instance_ip_addr" {
  value       = {
    for key, instance in aws_instance.my_instance : key => instance.public_ip
  }
  description = "public ip of all 4 instance"
}

output "instance_ids" {
  value = {
    for key, instance in aws_instance.my_instance : key => instance.id
  }
}