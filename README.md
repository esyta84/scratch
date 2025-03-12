# vSphere VM Terraform Module

This Terraform module deploys a virtual machine on a VMware vSphere environment.

## Requirements

* Terraform >= 1.0.0
* vSphere provider ~> 2.4.0
* vCenter Server with vSphere environment

## Usage

```hcl
module "vsphere_vm" {
  source = "path/to/module"

  # Required parameters
  vm_name          = "my-vm"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id       = data.vsphere_network.network.id
  template_id      = data.vsphere_virtual_machine.template.id

  # Optional parameters with defaults
  num_cpus         = 2
  memory           = 4096
  disk_size        = 20
  thin_provisioned = true
  guest_id         = "other3xLinux64Guest"
  folder           = ""
  domain           = "local"
  ipv4_address     = null  # Set to use DHCP
  ipv4_netmask     = 24
  ipv4_gateway     = null  # Set to use DHCP
}
```

## Example with vSphere Data Sources

```hcl
provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "your-datacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "your-datastore"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "your-cluster"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "your-resource-pool"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "your-network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "your-template"
  datacenter_id = data.vsphere_datacenter.dc.id
}

module "vsphere_vm" {
  source = "path/to/module"

  vm_name          = "my-vm"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id       = data.vsphere_network.network.id
  template_id      = data.vsphere_virtual_machine.template.id
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vm_name | The name of the virtual machine | string | n/a | yes |
| resource_pool_id | The ID of the resource pool to deploy the VM to | string | n/a | yes |
| datastore_id | The ID of the datastore to deploy the VM to | string | n/a | yes |
| network_id | The ID of the network to connect the VM to | string | n/a | yes |
| template_id | The ID of the template to clone the VM from | string | n/a | yes |
| folder | The folder to place the VM in | string | "" | no |
| num_cpus | The number of CPUs for the VM | number | 2 | no |
| memory | The amount of memory (in MB) for the VM | number | 4096 | no |
| guest_id | The guest ID for the VM | string | "other3xLinux64Guest" | no |
| disk_size | The size of the VM's disk in GB | number | 20 | no |
| thin_provisioned | Whether to thin provision the disk | bool | true | no |
| domain | The domain name for the VM | string | "local" | no |
| ipv4_address | The IPv4 address for the VM | string | null | no |
| ipv4_netmask | The IPv4 netmask for the VM | number | 24 | no |
| ipv4_gateway | The IPv4 gateway for the VM | string | null | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | The ID of the created virtual machine |
| vm_name | The name of the created virtual machine |
| vm_ip_address | The IP address of the created virtual machine |
| vm_uuid | The UUID of the created virtual machine |

## License

MIT 