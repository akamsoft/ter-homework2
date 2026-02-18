variable "vms_resources" {

    description = "VMS resources"

    type = map(object({
        platform_id    = string
        cores          = number
        memory         = number
        core_fraction  = number
    }))

    default = {
        web = {
            platform_id   = "standard-v3"
            cores         = 2
            memory        = 1
            core_fraction = 20
        },
        db = {
            platform_id   = "standard-v3"
            cores         = 2
            memory        = 2
            core_fraction = 20
        }
    }
}


###cloud vars

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone VM"
}

variable "default_zone_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_db" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}

###vm_db

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image ID"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM Name"
}

#variable "vm_db_platform_id" {
#  type        = string
#  default     = "standard-v3"
#  description = "Platform ID"
#}

#variable "vm_db_cores" {
#  type = number
#  default = 2
#  description = "vCPU VM"
#}

#variable "vm_db_memory" {
#  type = number
#  default = 2
#  description = "RAM VM"
#}

#variable "vm_db_core_fraction" {
#  type = number
#  default = 20
#  description = "% vCPU"
#}

variable "vm_db_preemptible" {
  type = bool
  default = true
  description = "Preemptible VM"
}

variable "vm_db_nat" {
  type = bool
  default = true
  description = "Use NAT"
}

variable "vm_db_serial-port-enable" {
  type = number
  default = 1
  description = "Activate serial port"
}