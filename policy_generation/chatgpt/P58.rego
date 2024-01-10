package accesscontrol

default allow = false

allow {
    input.employee_attributes.department == "Research and Development"
    input.employee_attributes.security_clearance == "Top Secret"
    input.employee_attributes.location == "Secure Facility"
    input.employee_attributes.project_role == "Lead Researcher"
    input.employee_attributes.work_schedule == "Full-Time"
    is_regular_business_hours
}

is_regular_business_hours {
    current_time := get_current_time()
    current_day := get_current_day()

    is_weekday := current_day == "Monday" || current_day == "Tuesday" || current_day == "Wednesday" || current_day == "Thursday" || current_day == "Friday"
    is_business_hours := current_time >= "09:00" && current_time <= "17:00"

    is_weekday && is_business_hours
}

get_current_time() = time {
    time := std.time.now().hour + ":" + std.time.now().minute
}

get_current_day() = day {
    day := std.time.now().weekday
}
