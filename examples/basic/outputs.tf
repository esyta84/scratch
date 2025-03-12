output "vm_id" {
  description = "The ID of the created virtual machine"
  value       = module.vm.vm_id
}

output "vm_name" {
  description = "The name of the created virtual machine"
  value       = module.vm.vm_name
}

output "vm_ip_address" {
  description = "The IP address of the created virtual machine"
  value       = module.vm.vm_ip_address
}

output "vm_uuid" {
  description = "The UUID of the created virtual machine"
  value       = module.vm.vm_uuid
} 