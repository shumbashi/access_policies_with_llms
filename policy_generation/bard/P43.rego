package leave_policy

# Define user roles
roles := {
    "employee": true,
    "manager": true,
    "hr_manager": true
}

# Define a rule to check if a user has a specific role
has_role(user, role) {
    roles[role]
    user.roles[_] = role
}

# Define a rule to check if a user is the direct manager of another user
is_direct_manager(manager, employee) {
    employees := data.employees
    employee_data := employees[employee]
    manager_data := employees[manager]
    employee_data.manager_id = manager_data.id
}

# Define a rule to check if a user is the HR manager
is_hr_manager(user) {
    has_role(user, "hr_manager")
}

# Define the main authorization rule
allow = true {
    input.action = "submit_leave_request"
    has_role(input.user, "employee")
}

allow = true {
    input.action = "approve_leave_request"
    input.leave_duration < 4
    is_direct_manager(input.user, input.requester)
}

allow = true {
    input.action = "approve_leave_request"
    is_hr_manager(input.user)
}

# Default deny rule
default allow = false
