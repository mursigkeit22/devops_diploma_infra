resource "yandex_iam_service_account" "sa" {
   name        = var.kuber_sa_name
   description = "this is a service account for kubernetes"
 }

 resource "yandex_resourcemanager_folder_iam_member" "service-account-editor" {
  folder_id   = var.folder_id
  role        = "editor"
  member      = "serviceAccount:${resource.yandex_iam_service_account.sa.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "service-account-puller" {
  folder_id   = var.folder_id
  role        = "container-registry.images.puller"
  member      = "serviceAccount:${resource.yandex_iam_service_account.sa.id}"
}