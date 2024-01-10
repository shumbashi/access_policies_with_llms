package accesscontrol

default allow = false

allow {
    input.user.department == "HR"
    input.user.seniority < 3
    input.action == "view"
}

allow {
    input.user.department == "HR"
    input.user.seniority >= 3
    input.action == "edit"
}

deny {
    input.user.department == "HR"
    input.user.seniority >= 3
    input.action == "delete"
}
