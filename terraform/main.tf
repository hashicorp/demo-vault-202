provider "vault" { }

# Create a policy document
data "vault_policy_document" "autounseal" {
    rule {
        path         = "transit/encrypt/autounseal-key"
        capabilities = ["update"]
    }
    rule {
        path         = "transit/decrypt/autounseal-key"
        capabilities = ["update"]
    }
}

# Create 'autounseal' policy
resource "vault_policy" "autounseal" {
    name   = "autounseal"
    policy = data.vault_policy_document.autounseal.hcl
}

# Enable Transit secrets engine
resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"
}

resource "vault_transit_secret_backend_key" "key" {
  depends_on = [vault_mount.transit]
  backend = "transit"
  name    = "autounseal-key"
  deletion_allowed = true
}
