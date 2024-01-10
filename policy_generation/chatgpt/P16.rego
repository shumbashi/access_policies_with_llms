package access_control

default allow = false

allow {
    input.action == "read"
    input.subject.clearance == "Confidential"
    input.resource.clearance <= "Confidential"
}

deny {
    not allow
}
