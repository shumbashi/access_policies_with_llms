package accesscontrol

default allow = false

allow {
    input.role == "HR"
    input.seniority < 3
    input.action == "view"
}

allow {
    input.role == "HR"
    input.seniority >= 3
    input.action == "edit"
}

deny {
    input.role == "HR"
    input.seniority >= 3
    input.action == "delete"
}
