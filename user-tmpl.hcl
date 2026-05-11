# Copyright IBM Corp. 2019, 2026

# Grant permissions on user specific path
path "user-kv/data/{{identity.entity.name}}/*" {
	capabilities = [ "create", "update", "read", "delete", "list" ]
}
