output "ssh_private_key" {
  value     = tls_private_key.vm_ssh.private_key_pem
  sensitive = true
}

output "ssh_public_key" {
  value = tls_private_key.vm_ssh.public_key_openssh
}
