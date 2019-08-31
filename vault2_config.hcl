storage "raft" {
  path    = "/workstation/vault/raft-node2/"
  node_id = "node2"
}
listener "tcp" {
  address = "127.0.0.1:6200"
  cluster_address = "127.0.0.1:6201"
  tls_disable = true
}
seal "transit" {
  address            = "http://127.0.0.1:8200"
  token              = ""
  disable_renewal    = "false"

  // Key configuration
  key_name           = "autounseal-key"
  mount_path         = "transit/"
}
disable_mlock = true
api_addr = "http://127.0.0.1:6200"
cluster_addr = "http://127.0.0.1:6201"
