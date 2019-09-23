# Create user-tmpl policy
vault policy write user-tmpl ./user-tmpl.hcl

# Create group-tmpl policy
vault policy write group-tmpl ./group-tmpl.hcl

# Add user-tmpl policy to bob-smith entity
vault write identity/entity/id/$(cat entity_id.txt) policies="base, user-tmpl"

# Add group-tmpl policy to the engineers group
vault write identity/group/id/$(cat group_id.txt) policies="team-eng, group-tmpl"

# Enable kv-v2 at user-kv path
vault secrets enable -path=user-kv kv-v2

# Enable kv-v2 at group-kv path
vault secrets enable -path=group-kv kv-v2

# Login as bob
echo "login as bob"
vault login -method=userpass username="bob" password="training"

echo "vault kv put user-kv/bob-smith/apikey webapp=12344567890"
vault kv put user-kv/bob-smith/apikey webapp="12344567890"

echo "vault kv put group-kv/team/Engineering/db_pswd password=ABCDEFGHIJKLMN"
vault kv put group-kv/team/Engineering/db_pswd password="ABCDEFGHIJKLMN"

# Update the engineers group metadata
vault write identity/group/id/$(cat group_id.txt) metadata=region="North America" metadata=team="Engineering" metadata=contact_email="james@example.com"

# Log back in with root Tokenvault login $(grep 'Initial Root Token:' key.txt | awk '{print $NF}')
vault login $(grep 'Initial Root Token:' /workstation/vault/key.txt | awk '{print $NF}')

echo "******* Command execution completed *******"
