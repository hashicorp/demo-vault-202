cd /workstation/vault
sudo systemctl start vault

sleep 2

echo "sudo systemctl start vault"
sudo systemctl start vault

# Initialize Vault and store the unseal key and initial token in key.txt
vault operator init -key-shares=1 -key-threshold=1 > key.txt

# Unseal Vault
vault operator unseal $(grep 'Key 1:' key.txt | awk '{print $NF}')

# Login with initial root token
vault login $(grep 'Initial Root Token:' key.txt | awk '{print $NF}')

# Install the VE license
./license.sh

# Create an initial set of policies, etc.
./vault-setup.sh

echo "******* Command execution completed *******"
