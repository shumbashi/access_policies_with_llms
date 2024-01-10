package marketing_documents

default allow = false

allow = true {
    # Check if the user is from the Marketing department
    input.user.department == "Marketing"

    # Check if the action is "edit"
    input.action == "edit"

    # Check if the resource is a marketing document
    resource := data.documents[input.resource]
    resource.type == "marketing"
}
