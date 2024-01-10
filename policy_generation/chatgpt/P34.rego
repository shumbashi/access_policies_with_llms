package budget_approval

default allow = false

# Define the allowed conditions for budget approval
allow {
    input.role == "Finance"
    input.action == "approve"
    input.request_amount <= 100000  # Adjust the specified limit as needed
}

# Deny any other actions or roles by default
deny {
    not allow
}
