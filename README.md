Приложение доступно по ссылке: https://devopsdiploma.site/catalog

Прометеус и графана для удобства проверки:

 https://prometheus.devopsdiploma.site/

 https://grafana.devopsdiploma.site/ (admin admin)
### Шаги:
- докеризовать приложение  (репозиторий по ссылке https://gitlab.praktikum-services.ru/std-009-052/momo-store)
-  купить домен
-  поднять инфраструктуру ( terraform конфиги по ссылке https://gitlab.praktikum-services.ru/std-009-052/diploma_infra/-/tree/main/terraform)
- установить Ingress-контроллер NGINX с менеджером для сертификатов Let's Encrypt по инструкции https://cloud.yandex.ru/docs/managed-kubernetes/tutorials/ingress-cert-manager 
	- манифест acme-issuer.yaml для создания сертификатов лежит по ссылке https://gitlab.praktikum-services.ru/std-009-052/diploma_infra/-/tree/helm/manifests
	- настроить DNS запись по инструкции https://cloud.yandex.ru/docs/dns/quickstart
- создать статический файл конфигурации для подключения к кластеру из пайплайна Гитлаба по инструкции https://cloud.yandex.ru/docs/managed-kubernetes/operations/connect/create-static-conf и добавить его в переменные Гитлаба
	- манифест sa.yaml для создания сервисного аккаунта лежит по ссылке https://gitlab.praktikum-services.ru/std-009-052/diploma_infra/-/tree/helm/manifests
	- в конфиге certificate-authority на certificate-authority-data. Содержимое сертификата должно быть в base64: cat ca.pem | base64 -w 0  (Mожно взять из файла .kube/config)
	- добавить неймспейс (default в данном случае) в конфиг, чтобы не было конфликта с неймспейсом гитлаба 
- создать helm package приложения:
	- завести в Nexus  репозиторий для helm-пакетов, добавить креды в gitlab
	- создать helm-репозиторий приложения https://gitlab.praktikum-services.ru/std-009-052/diploma_infra/-/tree/main/momo-store-chart
	- сделать пайплайн для установки helm-пакета с приложением: https://gitlab.praktikum-services.ru/std-009-052/diploma_infra/-/blob/main/.gitlab-ci.yml
- подключить Prometheus в кластер
	- манифесты лежат по ссылке https://gitlab.praktikum-services.ru/std-009-052/diploma_infra/-/tree/main/manifests/prometheus
	- UI по ссылке https://prometheus.devopsdiploma.site/graph 
	- добавила kube-state-metrics https://github.com/kubernetes/kube-state-metrics 
- подключить локи и графану в кластер
	- репозиторий с helm-чартом https://github.com/grafana/helm-charts/tree/main/charts/loki-stack
	- UI графаны по адресу https://grafana.devopsdiploma.site/ , логин admin пароль admin 
	- ингрес-файл по ссылке https://gitlab.praktikum-services.ru/std-009-052/diploma_infra/-/blob/main/manifests/grafana/grafana-ingress.yaml
	- подключить 2 datasource'а: локи и прометеус
	- импортировать дашборды
