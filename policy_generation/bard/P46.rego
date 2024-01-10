package leave_approval

# Data input definition
data input {
  user           string
  manager        string
  hr_manager    string
  leave_duration int
  action         string
}

# Rule for employee submitting leave request
allow {
  input.action == "submit"
}

# Rule for direct manager approving leave (less than 4 days)
allow {
  input.action == "approve"
  input.leave_duration < 4
  input.manager == input.user.manager
}

# Rule for HR manager approving leave (4 days or more)
allow {
  input.action == "approve"
  input.leave_duration >= 4
  input.user.manager == input.hr_manager
}

# Deny any other action or access attempt
deny {
  true
}
