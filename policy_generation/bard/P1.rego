package abac

default allow = false

allow = true {
    # Check if the user is authenticated
    input.user.isAuthenticated == true

    # Check if the data is public
    input.data.visibility == "public"

    # Check if the action is "view"
    input.action == "view"
}
