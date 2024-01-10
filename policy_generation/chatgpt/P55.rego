package access_control

default allow = false

allow {
    employee_attributes.department == "Research and Development"
    employee_attributes.security_clearance == "Top Secret"
    employee_attributes.location == "Secure Facility"
    employee_attributes.project_role == "Lead Researcher"
    employee_attributes.work_schedule == "Full-Time"
    is_regular_business_hours
}

is_regular_business_hours {
    current_time := get_current_time()
    current_time.hour >= 9  # Assuming regular business hours start at 9 AM
    current_time.hour < 17  # Assuming regular business hours end at 5 PM
}

get_current_time {
    # Implement a function to get the current time (hour, minute, etc.)
    # This can vary depending on the environment or system you are using.
    # For the sake of simplicity, assume a function like get_current_time() is provided.
    current_time = get_current_time()
}
