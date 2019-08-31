# Manage namespaces
path "sys/namespaces/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage policies via API
path "sys/policies/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage policies via CLI
path "sys/policy/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies via CLI
path "sys/policy" {
  capabilities = ["read", "update", "list"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# List available secret engines
path "sys/mounts" {
  capabilities = [ "read" ]
}
