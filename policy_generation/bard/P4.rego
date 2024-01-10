package access_control

# Data required for policy evaluation
data = {
  "user": {
    "authenticated": true  # Set to true if user is authenticated
  },
  "resource": {
    "public": true      # Set to true if resource is public
  }
}

# Main rule for viewing public data
allow {
  # Check if user is authenticated and resource is public
  data.user.authenticated == true
  data.resource.public == true
}
