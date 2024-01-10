package access_control

# Data source definition
data user = {
  department: string
  security_clearance: string
  location: string
  project_role: string
  work_schedule: string
}

# Data source example
data project = {
  id: string
  confidentiality: string # "High" for highly confidential projects
}

# Access control rule
deny[msg := "User does not meet all requirements for access"] {
  # Check project confidentiality
  input.project.confidentiality == "High"

  # Check user attributes
  user.department == "Research and Development"
  user.security_clearance == "Top Secret"
  user.location == "Secure Facility"
  user.project_role == "Lead Researcher"
  user.work_schedule == "Full-Time"

  # Check time for regular business hours (assuming system provides a "current_time" input)
  current_time > start_of_business_hours and current_time < end_of_business_hours
}
