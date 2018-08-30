wlconf() {
  cp docker-ben.yaml docker-compose.yaml
  cp helm-ben.conf nginx/conf.d/fragments/helm.conf
  cp ben-vhost.conf nginx/conf.d/vhost.conf
}
