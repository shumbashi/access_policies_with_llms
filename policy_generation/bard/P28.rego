package sales_crm_access

# Define allowed work hours
work_hours = { start_time: "09:00:00", end_time: "17:00:00" }

# Check if current time is within work hours
is_work_hour(current_time) = 
  current_time.time >= work_hours.start_time and
  current_time.time <= work_hours.end_time

# Check if user is in the Sales department
is_sales_user(user) = 
  user.department == "Sales"

# Allow edit access only during work hours and for Sales users
allow[action == "edit"] {
  user = input.user
  current_time = input.current_time
  if is_sales_user(user) and is_work_hour(current_time) {
    true
  }
}

# Deny access for any other action or outside work hours
deny { _ }
