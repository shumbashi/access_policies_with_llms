package example

default allow = false

# Define the conditions for access
allow {
    input.user_attributes["Seniority Level"] == "Executive"
    input.document_attributes["Document Level"] == "Executive"
    is_valid_location(input.user_attributes["Location"])
    is_trusted_device(input.user_attributes["Device"])
}

# Define a function to check if the location is permitted
is_valid_location(location) {
    location == "US" || location == "Canada" || location == "France" || location == "Italy"
}

# Define a function to check if the device is trusted
is_trusted_device(device) {
    # Add conditions to check if the device is trusted
    # You may want to expand this based on your specific criteria
    device == "trusted_device"
}
