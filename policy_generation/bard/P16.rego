package access_control

# Define the allowed clearance levels
allowed_clearance_levels := {"Confidential", "Unclassified", "Public"}

# Define the rule for granting access
allow_access {
  # Check if the employee's clearance level is 'Confidential'
  employee_clearance_level = "Confidential"

  # Check if the document's classification level is 'Confidential' or lower
  document_classification := input.document.classification
  document_classification == "Confidential" || document_classification == "Unclassified" || document_classification == "Public"
}
