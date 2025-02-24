# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Grant permissions on user specific path
path "user-kv/data/{{identity.entity.name}}/*" {
	capabilities = [ "create", "update", "read", "delete", "list" ]
}
