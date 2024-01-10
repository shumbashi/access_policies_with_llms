package leave_approval

default allow = false

# Define employee role attribute
employee_roles = {
    "alice": "manager1",
    "bob": "employee",
    "charlie": "employee",
    "david": "employee",
    # Add more employees as needed
}

# Define manager role attribute
manager_roles = {
    "manager1": "direct_manager",
    "manager2": "direct_manager",
    # Add more direct managers as needed
}

# Define HR manager role attribute
hr_manager_roles = {
    "hr_manager": "hr_manager",
}

# Define leave duration threshold
max_leave_duration = 4

# Define leave request attributes
leave_request = {
    "employee": input.employee,
    "duration": input.duration,
}

# Check if the employee is in the employee_roles mapping
employee_role_exists {
    leave_request.employee = employee_roles[leave_request.employee]
}

# Check if the manager is in the manager_roles mapping
manager_role_exists {
    leave_request.employee = manager_roles[leave_request.employee]
}

# Check if the HR manager is in the hr_manager_roles mapping
hr_manager_role_exists {
    leave_request.employee = hr_manager_roles[leave_request.employee]
}

# Allow employees to submit leave requests
allow {
    employee_role_exists
}

# Allow direct managers to approve leave requests less than 4 days
allow {
    manager_role_exists
    leave_request.duration < max_leave_duration
}

# Allow HR manager to approve all leave requests
allow {
    hr_manager_role_exists
}
