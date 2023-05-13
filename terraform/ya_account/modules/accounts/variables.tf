variable "kuber_sa_name" {
  default     = "kuber-service-account"
  type        = string
  description = "name for service account to work with kuber cluster"
  nullable = false
} 
variable "folder_id" {
    type =    string
    description = "The Folder ID to operate under"
    nullable = false
}
