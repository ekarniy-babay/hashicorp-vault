# Login with AppRole
path "auth/approle/login" {
  capabilities = [ "create", "read" ]
}

# Read test data
path "sysadmins.club/*" {
  capabilities = [ "read" ]
}
