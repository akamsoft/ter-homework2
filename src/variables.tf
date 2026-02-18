###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOp84Th8BuBH1OIhPhU0uS/36wKmrq+0nkZZZSyjnXKj alex@DESKTOP-2B3DS8S"
  description = "ssh-keygen -t ed25519"
}

variable "instance_metadata" {
  description = "Metadata profiles for instances (web/db)."
  type = map(object({
    serial_port_enable = number
    ssh_keys           = string
  }))

  default = {
    web = {
      serial_port_enable = 1
      ssh_keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOp84Th8BuBH1OIhPhU0uS/36wKmrq+0nkZZZSyjnXKj alex@DESKTOP-2B3DS8S"
    }
    db = {
      serial_port_enable = 1
      ssh_keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOp84Th8BuBH1OIhPhU0uS/36wKmrq+0nkZZZSyjnXKj alex@DESKTOP-2B3DS8S"
    }
  }
}

###vm_web

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image ID"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM Name"
}

#variable "vm_web_platform_id" {
#  type        = string
#  default     = "standard-v3"
#  description = "Platform ID"
#}

#variable "vm_web_cores" {
#  type = number
#  default = 2
#  description = "vCPU VM"
#}

#variable "vm_web_memory" {
#  type = number
#  default = 1
#  description = "RAM VM"
#}

#variable "vm_web_core_fraction" {
#  type = number
#  default = 20
#  description = "% vCPU"
#}

variable "vm_web_preemptible" {
  type = bool
  default = true
  description = "Preemptible VM"
}

variable "vm_web_nat" {
  type = bool
  default = true
  description = "Use NAT"
}

variable "vm_web_serial-port-enable" {
  type = number
  default = 1
  description = "Activate serial port"
}