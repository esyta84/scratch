variable "vsphere_user" {
  description = "The vSphere user"
  type        = string
}

variable "vsphere_password" {
  description = "The vSphere password"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "The vSphere server"
  type        = string
}

# Terraform Enterprise configuration
variable "tfe_organization" {
  description = "The Terraform Enterprise organization name"
  type        = string
}

variable "tfe_workspace" {
  description = "The Terraform Enterprise workspace name"
  type        = string
}

variable "datacenter" {
  description = "The name of the datacenter"
  type        = string
}

variable "datastore" {
  description = "The name of the datastore"
  type        = string
}

variable "cluster" {
  description = "The name of the cluster"
  type        = string
}

variable "resource_pool" {
  description = "The name of the resource pool"
  type        = string
}

variable "network" {
  description = "The name of the network"
  type        = string
}

variable "template" {
  description = "The name of the template"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "terraform-vm"
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

variable "folder" {
  description = "The folder to place the VM in"
  type        = string
  default     = ""
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

variable "domain" {
  description = "The domain name for the VM"
  type        = string
  default     = "local"
} 