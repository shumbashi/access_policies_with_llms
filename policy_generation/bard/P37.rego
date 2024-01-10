package access_control

default allow = false

allow = true {
    # Check for executive-level user
    input.user.attributes.SeniorityLevel == "Executive"

    # Check for accessing executive-level document
    input.resource.type == "executive-document"

    # Check for permitted location
    permitted_location := ["US", "Canada", "France", "Italy"]
    input.user.location == permitted_location[_]

    # Check for trusted device
    input.user.device.isTrusted == true
}
