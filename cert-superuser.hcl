# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

path "education/certification/*" {
    capabilities = [ "create", "read", "update", "delete", "list", "sudo" ]
}
