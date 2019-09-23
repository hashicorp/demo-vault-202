# For the purpose of education, enable raw data log
vault audit enable file file_path=/workstation/vault/audit.log log_raw=true

# Enable K/V secrets engine
vault secrets enable -path=secret kv-v2

# Enable userpass auth method
vault auth enable userpass

# Create some initial policies
vault policy write base - <<"EOT"
path "secret/data/training_*" {
   capabilities = ["create", "read"]
}
EOT

vault policy write test - <<"EOT"
path "secret/data/test" {
   capabilities = [ "create", "read", "update", "delete" ]
}
EOT

vault policy write team-qa - <<"EOT"
path "secret/data/team/qa" {
   capabilities = [ "create", "read", "update", "delete" ]
}
EOT

vault policy write team-eng - <<"EOT"
path "secret/data/team/eng" {
   capabilities = [ "create", "read", "update", "delete" ]
}
EOT
