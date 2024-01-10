package access_control

default allow = false

allow = {
    input.action == "access"
    input.resource.type == "repository"
    user_is_in_rnd_dept
    project_has_rnd_tag
    current_time_is_working_hours
}

user_is_in_rnd_dept {
    user := input.user
    user.department == "Research and Development"
}

project_has_rnd_tag {
    project := input.resource.project
    project.tags[_] == "type=RND"
}

current_time_is_working_hours {
    now := time.now_ns() / 1000000000  // Convert to seconds
    weekday := time.weekday(now)
    hour := time.hour(now)

    # Working hours are Monday to Friday, 9 AM to 5 PM
    weekday >= 1 && weekday <= 5
    hour >= 9 && hour < 17
}
