variable "token" {
    type =    string
    description = "Security token used for authentication in the Yandex Cloud"
    nullable = false
}

variable "cloud_id" {
    type =    string
    description = "The ID of Cloud to apply any resources to"
    nullable = false
}

variable "folder_id" {
    type =    string
    description = "The Folder ID to operate under"
    nullable = false
}

