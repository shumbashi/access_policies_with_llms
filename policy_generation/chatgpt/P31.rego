package budget_approval

default allow = false

budget_request {
    input.action == "approve"
    input.department == "Finance"
    input.amount <= get_max_budget(input.department)
}

get_max_budget(department) = max_budget {
    department == "Finance"
    max_budget := 1000000  # Specify the maximum budget limit for the Finance department
}
