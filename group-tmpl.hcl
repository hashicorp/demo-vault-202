# Grant permissions on the group specific path
# The region is specified in the group metadata
path "group-kv/data/team/{{identity.groups.names.engineers.metadata.team}}/*" {
	capabilities = [ "create", "update", "read", "delete", "list" ]
}

# Group member can update the group information for group named, 'engineers'
path "identity/group/id/{{identity.groups.names.engineers.id}}" {
  capabilities = [ "update", "read" ]
}
