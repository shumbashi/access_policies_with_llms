package executive_access

# Define permitted locations
permitted_locations := {"US", "Canada", "France", "Italy"}

# Check access for a user
allow {
  # User must have 'Executive' seniority
  input.user.attributes["Seniority Level"] == "Executive"

  # User's location must be in the permitted list
  input.user.attributes["Location"] in permitted_locations

  # User must be using a trusted device
  input.user.attributes["Device Trust Level"] == "Trusted"
}

# Allow access to executive-level documents
allow {
  input.data.type == "Executive Document" && allow
}
