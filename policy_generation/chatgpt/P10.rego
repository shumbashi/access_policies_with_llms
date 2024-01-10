package example

default allow = false

allow {
    input.action == "edit"
    input.user.department == "Marketing"
    input.resource.type == "document"
    input.resource.department == "Marketing"
}
