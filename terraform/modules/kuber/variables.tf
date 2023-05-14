variable "cluster_name" {
    default = "diploma-cluster"
    type =    string
    description = "Name of kubernetes cluster"
    nullable = false
}
variable "network_id" {
    type =    string
    description = "The ID of the network in which cluster will be created"
    nullable = false
}

variable "subnet_id" {
    type =    string
    description = "The ID of the subnet in which cluster will be created"
    nullable = false
}

variable "zone" {
    type =    string
    description = "The name of the zone  in which cluster will be created"
    nullable = false
}

variable "service_account_id" {
    type =    string
    description = "Service account ID to operate under"
    nullable = false
}
