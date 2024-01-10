package hr_access

default allow = false

allow = true {
    # Define data source for user attributes
    user_attributes := data.hr_users[input.user]

    # Access allowed for viewing employee records
    is_view_action
    user_attributes.department == "HR"
    user_attributes.seniority >= 0

    # Access allowed for editing employee records
    is_edit_action
    user_attributes.department == "HR"
    user_attributes.seniority >= 3

    # Deletion of employee records is always denied
    not is_delete_action
}

# Helper functions for clarity
is_view_action { input.action == "view" }
is_edit_action { input.action == "edit" }
is_delete_action { input.action == "delete" }
