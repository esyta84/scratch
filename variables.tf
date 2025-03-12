variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_pool_id" {
  description = "The ID of the resource pool to deploy the VM to"
  type        = string
}

variable "datastore_id" {
  description = "The ID of the datastore to deploy the VM to"
  type        = string
}

variable "folder" {
  description = "The folder to place the VM in"
  type        = string
  default     = ""
}

variable "num_cpus" {
  description = "The number of CPUs for the VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "The amount of memory (in MB) for the VM"
  type        = number
  default     = 4096
}

variable "guest_id" {
  description = "The guest ID for the VM"
  type        = string
  default     = "other3xLinux64Guest"
}

variable "network_id" {
  description = "The ID of the network to connect the VM to"
  type        = string
}

variable "disk_size" {
  description = "The size of the VM's disk in GB"
  type        = number
  default     = 20
}

variable "thin_provisioned" {
  description = "Whether to thin provision the disk"
  type        = bool
  default     = true
}

variable "template_id" {
  description = "The ID of the template to clone the VM from"
  type        = string
}

variable "domain" {
  description = "The domain name for the VM"
  type        = string
  default     = "local"
}

variable "ipv4_address" {
  description = "The IPv4 address for the VM"
  type        = string
  default     = null
}

variable "ipv4_netmask" {
  description = "The IPv4 netmask for the VM"
  type        = number
  default     = 24
}

variable "ipv4_gateway" {
  description = "The IPv4 gateway for the VM"
  type        = string
  default     = null
} 