package example

default allow = false

# Define the document and user attributes
document = {
    "department": "Marketing",
    "type": "MarketingDocument",
    "edit_permission": ["Marketing"]
}

user = {
    "department": input.user_department,
    "role": input.user_role
}

# Allow editing if the user is from the Marketing department and the document type is MarketingDocument
allow {
    user.department == document.department
    user.role in document.edit_permission
    input.action == "edit"
    input.resource_type == document.type
}

# Deny access by default if no rule is matched
default allow = false
