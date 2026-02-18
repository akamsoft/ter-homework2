locals {
    instance = "dev-platform"
    web      = "web"
    db       = "db"
    vm_web = "${local.instance}-${local.web}"
    vm_db = "${local.instance}-${local.db}"
}