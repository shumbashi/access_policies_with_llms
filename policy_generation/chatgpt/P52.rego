package access_control_policy

import input

default allow = false

allow {
    user := input.user
    resource := input.resource
    time := input.time

    user.department == "Research and Development"
    resource.type == "source_code_repository"
    resource.tags[type] == "RND"
    is_working_hours(time)
}

is_working_hours(time) {
    start_hour := 9
    end_hour := 17
    time.weekday == "Monday" || time.weekday == "Tuesday" || time.weekday == "Wednesday" || time.weekday == "Thursday" || time.weekday == "Friday"
    time.hour >= start_hour
    time.hour < end_hour
}
