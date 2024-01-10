package sales_crm_policy

default allow = false

# Define the conditions for allowing access
allow {
    isSalesDepartment
    isEditOperation
    isWorkHours
}

# Check if the user belongs to the Sales department
isSalesDepartment {
    user = input.user
    user.department == "Sales"
}

# Check if the operation is an edit operation
isEditOperation {
    input.operation == "edit"
}

# Check if the current timestamp is within work hours (9 AM to 5 PM)
isWorkHours {
    currentHour = getCurrentHour(input.timestamp)
    currentHour >= 9
    currentHour < 17
}

# Helper function to extract the hour from a timestamp
getCurrentHour(timestamp) = {
    parsedTime := time.parse_rfc3339(timestamp)
    hour := parsedTime.hour()
}
