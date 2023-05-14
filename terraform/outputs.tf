output "created_kuber" {
    value = module.kuber.created_kuber
}

output "yandex_vpc_subnets" {
    value = module.nets.yandex_vpc_subnets
}
output "yandex_vpc_network" {
    value = module.nets.yandex_vpc_network
}
