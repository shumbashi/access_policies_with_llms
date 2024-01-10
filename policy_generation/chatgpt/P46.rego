package leave_policy

default allow = false

# Rule 1: All employees can submit leave requests
allow {
    input.action == "submit"
    input.subject.role == "employee"
}

# Rule 2: Direct managers can approve leave if the duration is less than 4 days
allow {
    input.action == "approve"
    input.subject.role == "manager"
    input.resource.type == "leave"
    input.resource.duration < 4
    input.resource.status == "pending"
    input.resource.requester_manager == input.subject.id
}

# Rule 3: HR manager can approve leave requests for any duration
allow {
    input.action == "approve"
    input.subject.role == "hr_manager"
    input.resource.type == "leave"
    input.resource.status == "pending"
}

# Rule 4: Deny all other actions by default
deny {
    not allow
}
