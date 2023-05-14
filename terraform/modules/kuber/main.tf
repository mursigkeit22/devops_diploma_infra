resource "yandex_kubernetes_cluster" "kuber-cluster" {
  name = var.cluster_name
  network_id = var.network_id
  master {
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
    public_ip = true
  }
  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id
  
 
}