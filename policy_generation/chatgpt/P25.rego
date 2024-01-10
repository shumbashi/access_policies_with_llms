package crm_access_policy

default allow = false

# Rule to allow users from the Sales department to edit CRM records during work hours
allow {
    input.action == "edit"
    input.resource.type == "CRMRecord"
    input.user.department == "Sales"
    is_work_hours
}

# Helper rule to check if it is work hours (9 AM to 5 PM)
is_work_hours {
    current_time := get_current_hour()
    current_time >= 9
    current_time < 17
}

# Function to get the current hour from the input timestamp
get_current_hour() = hour {
    parsed_time := time.parse_rfc3339_ns(input.timestamp)
    hour = parsed_time.hour()
}
