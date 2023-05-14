resource "yandex_kubernetes_node_group" "node-group" {
  cluster_id = var.cluster_id
  name       = var.node_name
  
  instance_template {
    container_runtime {
     type = "docker"
    }
    scheduling_policy {
      preemptible = var.preemptible
    }
     resources {
      memory = var.memory
      cores  = var.cores
    }
    network_interface {
      nat                = true
      subnet_ids         = [var.subnet_id]
    }
    
  }
  
  scale_policy {
    auto_scale {
      min = 1
      max = 2
      initial = 1
    }
  }
}