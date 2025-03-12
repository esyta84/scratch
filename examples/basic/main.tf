terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.4.0"
    }
  }
  required_version = ">= 1.0.0"
  
  cloud {
    organization = var.tfe_organization
    
    workspaces {
      name = var.tfe_workspace
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}

module "vm" {
  source = "../../"

  vm_name          = var.vm_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  network_id       = data.vsphere_network.network.id
  template_id      = data.vsphere_virtual_machine.template.id
  
  # Optional parameters
  num_cpus         = var.num_cpus
  memory           = var.memory
  disk_size        = var.disk_size
  thin_provisioned = var.thin_provisioned
  folder           = var.folder
  
  # Network configuration
  ipv4_address     = var.ipv4_address
  ipv4_netmask     = var.ipv4_netmask
  ipv4_gateway     = var.ipv4_gateway
  domain           = var.domain
} 