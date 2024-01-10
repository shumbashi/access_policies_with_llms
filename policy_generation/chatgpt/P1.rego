package abac_policy

default allow = false

allow {
    authenticated_user
    resource_is_public_data
}

authenticated_user {
    input.user.authenticated == true
}

resource_is_public_data {
    input.resource.type == "public_data"
}
