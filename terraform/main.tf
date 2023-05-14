module "accounts" {
    source = "./modules/accounts"
    folder_id = var.folder_id
}
module "nets" {
    source = "./modules/nets"
    zone = var.zone
}
module "kuber" {
    source = "./modules/kuber"
    service_account_id = module.accounts.service_account_id
    zone = var.zone
    network_id = module.nets.yandex_vpc_network.id
    subnet_id = module.nets.yandex_vpc_subnets.id
    depends_on = [
    module.accounts
  ]
}
module "nodes" {
    source = "./modules/nodes"
    cluster_id = module.kuber.cluster_id
    subnet_id = module.nets.yandex_vpc_subnets.id
    
}

