output "vm_id" {
  description = "The ID of the created virtual machine"
  value       = vsphere_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of the created virtual machine"
  value       = vsphere_virtual_machine.vm.name
}

output "vm_ip_address" {
  description = "The IP address of the created virtual machine"
  value       = vsphere_virtual_machine.vm.default_ip_address
}

output "vm_uuid" {
  description = "The UUID of the created virtual machine"
  value       = vsphere_virtual_machine.vm.uuid
} 