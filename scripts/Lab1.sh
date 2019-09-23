# Create a new user, bob
vault write auth/userpass/users/bob password="training" policies="test"

# Create a new user, bsmith
vault write auth/userpass/users/bsmith password="training" policies="team-qa"

# Grab and store userpass auth accessor value
vault auth list -format=json | jq -r '.["userpass/"].accessor' > accessor.txt

# Create a new entity, bob-smith
vault write -format=json identity/entity name="bob-smith" policies="base" metadata=organization="ACME Inc." metadata=team="QA" | jq -r ".data.id" > entity_id.txt

# Add 'bob' as an entity alias
vault write identity/entity-alias name="bob" canonical_id=$(cat entity_id.txt) mount_accessor=$(cat accessor.txt)

# Add 'bsmith' as an entity alias
vault write identity/entity-alias name="bsmith" canonical_id=$(cat entity_id.txt) mount_accessor=$(cat accessor.txt)

# Create an internal group, 'engineers' with 'bob-smith' entity as its member
vault write -format=json identity/group name="engineers" policies="team-eng" member_entity_ids=$(cat entity_id.txt) metadata=team="Engineering" metadata=region="North America" | jq -r ".data.id" > group_id.txt

echo "******* Command execution completed *******"
