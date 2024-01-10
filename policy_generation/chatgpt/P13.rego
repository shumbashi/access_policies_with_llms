package abac

default allow = false

allow {
    input.action == "read"
    input.resource.classification == "Confidential"
    input.subject.clearance_level == "Confidential"
}
