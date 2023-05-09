module "yandex_accounts" {
    source = "./modules/accounts"
    folder_id = var.folder_id
}

module "yandex_nets" {
    source = "./modules/nets"
}
