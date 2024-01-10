package hr_access_policy

default allow = false

allow {
  input.action == "view"
  input.user.department == "HR"
  input.user.seniority >= 0
}

allow {
  input.action == "edit"
  input.user.department == "HR"
  input.user.seniority >= 3
}

deny[msg] {
  input.action == "delete"
  msg = "Deleting employee records is not allowed"
}
