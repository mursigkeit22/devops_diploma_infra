output "created_kuber" {
    value = resource.yandex_kubernetes_cluster.kuber-cluster
}

output "cluster_id" {
    value = resource.yandex_kubernetes_cluster.kuber-cluster.id
}
