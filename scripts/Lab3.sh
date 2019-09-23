vault login $(grep 'Initial Root Token:' /workstation/vault/key.txt | awk '{print $NF}')

cd sentinel
tree
sentinel test

# Create business-hrs EGP
vault write sys/policies/egp/business-hrs policy=@business-hrs.sentinel paths="secret/data/shipment/*" enforcement_level="hard-mandatory"

# Create cidr-check EGP
vault write sys/policies/egp/cidr-check policy=@cidr-check.sentinel paths="secret/data/accounting/*" enforcement_level="soft-mandatory"

# Update base policy
vault policy write base - <<"EOT"
path "secret/data/training_*" {
   capabilities = ["create", "read"]
}

path "secret/data/accounting/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
