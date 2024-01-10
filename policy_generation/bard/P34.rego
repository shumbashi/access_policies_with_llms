package budget_approval

# Data input from the authorization request
data input {
  user = user.name  # User making the request
  department = user.department  # User's department
  amount = request.amount  # Requested budget amount
  limit = system.budget_limit  # Defined limit for department approvals
}

# Rule for finance department access
allow {
  action = "approve_budget"
  input.department == "Finance"
}

# Rule for exceeding budget limit
deny {
  input.action == "approve_budget"
  input.department == "Finance"
  input.amount > input.limit
}

# Default policy: deny access for other departments or any invalid action
deny {
  _
}
