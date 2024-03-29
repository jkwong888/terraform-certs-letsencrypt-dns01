output "master_cert" {
  value = "${acme_certificate.master_certificate.certificate_pem}${acme_certificate.master_certificate.issuer_pem}"
}

output "master_key" {
  value = "${acme_certificate.master_certificate.private_key_pem}"
}

output "router_cert" {
  value = "${acme_certificate.app_subdomain_certificate.certificate_pem}${acme_certificate.app_subdomain_certificate.issuer_pem}"
}

output "router_key" {
  value = "${acme_certificate.app_subdomain_certificate.private_key_pem}"
}

data "http" "letsencrypt_ca_cert" {
  url = "https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt"
}

# write out the letsencrypt CA
output "ca_cert" {
    value = "${data.http.letsencrypt_ca_cert.body}"
}
