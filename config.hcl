# Use the file storage - this will write encrypted data to disk.
storage "file" {
  path = "/workstation/vault/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

disable_mlock = true
ui = true
