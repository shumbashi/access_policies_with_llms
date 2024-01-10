package main

# Define a rule to check if the user is authenticated
authenticated_user[user] {
    input.user == user
    input.authenticated == true
}

# Define a rule to allow access to public data for authenticated users
allow_access {
    authenticated_user[input.user]
    input.resource.type == "public_data"
}

# Deny access by default
deny {
    not allow_access
}
