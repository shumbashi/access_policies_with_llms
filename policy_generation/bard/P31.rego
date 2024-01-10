package budget_approval

default allow = false

allow = true {
    # Check if the user is in the Finance department
    input.user.department == "Finance"

    # Check if the action is budget approval
    input.action == "approve"

    # Ensure the budget request amount is within the limit
    input.request_amount <= data.budget_limits[input.user.name]
}
