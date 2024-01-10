package access_control

default allow = false

allow = true {
    is_user_in_rnd_dept
    is_project_type_rnd
    is_working_hours
}

is_user_in_rnd_dept {
    input.user.department == "Research and Development"
}

is_project_type_rnd {
    some i
    input.project.tags[i] == "type=RND"
}

is_working_hours {
    now := time.now_utc
    weekday := now.weekday
    hour := now.hour
    (weekday >= 1 && weekday <= 5) && (hour >= 9 && hour <= 17)
}
