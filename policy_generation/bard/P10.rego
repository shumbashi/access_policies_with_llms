package access_control

# Allow editing marketing documents if user is in the Marketing department
allow {
    input.action == "edit"
    input.resource.type == "document"
    input.resource.metadata.department == "Marketing"
    input.user.department == "Marketing"
}
