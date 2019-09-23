# Create a new namespaces
vault namespace create education
vault namespace create -namespace=education training
vault namespace create -namespace=education certification

# Create 'edu-admin' policy in education NS
vault policy write -ns=education edu-admin edu-admin.hcl

# Create 'training-admin' policy in education/training NS
vault policy write -ns=education/training training-admin training-admin.hcl

# Create namespace-aware policy, 'cert-superuser'
vault policy write cert-superuser cert-superuser.hcl

# Attach 'cert-superuser' policy to user, bob
vault write auth/userpass/users/bob password="training" policies="test, cert-superuser"

# Create 'edu-admin' group in the education NS with bob-smith entity as its member
vault write -ns=education identity/group name="edu-admin" policies="edu-admin" member_entity_ids=$(cat entity_id.txt)

# Login as bob
vault login -format=json -method=userpass username=bob password=training | jq -r ".auth.client_token" > bob-token.txt

# Examine bob's token info
# Notice the 'external_namespace_policies'
vault login $(grep 'Initial Root Token:' /workstation/vault/key.txt | awk '{print $NF}')
vault token lookup $(cat bob-token.txt)

echo "******* Command execution completed *******"
