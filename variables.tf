variable "vnet_rg_name" {
  type        = string
  description = "The vnet Resource Group Name."
}

variable "vnet_name" {
  type        = string
  description = "The name of the vnet name where Publisher will be deployed."
}

variable "snet_name" {
  type        = string
  description = "Name of the subnet where Publisher interface will be attached."
}
variable "env_prefix" {
  type        = string
  description = "Environment prefix to use to label resources in cloud deployment."
  default     = "PRD"
}

variable "vm_prefix" {
  type        = string
  description = "The vm Prefix details of the VM."
  default     = "NPA"
}

variable "vm_size" {
  description = "The Virtual Machine Size for the CE VM deployment."
  default     = "Standard_B2ms"
}

variable "admin_username" {
  type        = string
  description = "The Virtual Machine default local admin username for the NVAs deployment."
  default     = ""
}

variable "trusted_ip" {
  type        = string
  description = "IP address allowed for the configuration and NSG rules."
}

variable "img_sku" {
  type        = string
  description = "Azure Marketplace default image sku"
  default     = "npa_publisher"
}

variable "img_version" {
  type        = string
  description = "Publisher version by default the 'latest' available version in the Azure Marketplace is selected"
  default     = "latest"
}

variable "admin_ssh_key" {
  type        = string
  description = "File Path for the admin public SSH key used to connect to the CE virtual machine, whose format is required to be the openSSH key format with optional comment."
  default     = ""
}

variable "publisher_name" {
  type        = string
  description = "The name of the netskope publisher to create in netskope tenant."
}


