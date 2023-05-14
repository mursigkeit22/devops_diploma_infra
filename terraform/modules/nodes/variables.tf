variable "cluster_id" {
    type =    string
    description = "ID of kubernetes cluster"
    nullable = false
}

variable "node_name" {
    default = "node-group"
    type =    string
    description = "Name of a node group"
    nullable = false
}

variable "subnet_id" {
    type =    string
    description = "The ID of the subnet in which nodes will be created"
    nullable = false
}

variable "preemptible" {
    type = bool
    default = false
    description = "Preemptible instances are stopped at least once every 24 hours, and can be stopped at any time"
}

variable "cores" {
  default     = 2
  type        = number
  description = "Number of CPU cores allocated for instance."
  nullable = false
} 

variable "memory" {
  default     = 2
  type        = number
  description = "Memory size allocated for instance."
  nullable = false
} 

