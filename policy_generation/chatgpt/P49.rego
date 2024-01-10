package main

default allow = false

# Define a function to check if the user is from the 'Research and Development' department
isRnDUser[user] {
    user.department == "Research and Development"
}

# Define a function to check if the project has the tag type=RND
hasRnDTag[project] {
    project.tags[type] == "RND"
}

# Define the main access control rule
allow {
    input.action == "access"
    input.resource.type == "source_code_repository"
    isRnDUser[input.user]
    hasRnDTag[input.project]
    isWorkingHours
}

# Define a function to check if the current time is within working hours
isWorkingHours {
    current_time := time.now_ns() / 1000000 # convert to milliseconds
    start_time := time.parse("09:00", "15:04")
    end_time := time.parse("17:00", "15:04")
    current_day := time.weekday(current_time)

    current_time >= start_time
    current_time <= end_time
    current_day >= 1 # Monday
    current_day <= 5 # Friday
}
