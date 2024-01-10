package acl

# Define regular business hours (modify as needed)
regular_business_hours = {
  weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  start_time = "08:00";
  end_time = "17:00";
}

# Check if current time is within regular business hours
is_business_hours = input.current_time >= regular_business_hours.start_time
                      && input.current_time <= regular_business_hours.end_time
                      && input.current_time in regular_business_hours.weekdays;

# Define required attributes for access
required_attributes = {
  "Department": "Research and Development",
  "Security Clearance": "Top Secret",
  "Location": "Secure Facility",
  "Project Role": "Lead Researcher",
  "Work Schedule": "Full-Time",
};

# Allow access only if all required attributes match and it's business hours
allow = is_business_hours &&
        all(key, value in required_attributes) {
          input.user[key] == value
        };

# Default deny if any condition fails
default deny = true;
