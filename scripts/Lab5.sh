cd /workstation/vault/terraform

# Set VAULT_TOKEN env variable
export VAULT_TOKEN="$(grep 'Initial Root Token:' ../key.txt | awk '{print $NF}')"

echo "terraform init"
terraform init

sleep 2

echo "terraform plan"
terraform plan

echo "terraform apply -auto-approve"
terraform apply -auto-approve

sleep 2

echo "vault policy list"
vault policy list

echo "vault policy read autounseal"
vault policy read autounseal

echo "vault secrets list"
vault secrets list

echo "vault list transit/keys"
vault list transit/keys

unset VAULT_TOKEN

echo "******* Command execution completed *******"
