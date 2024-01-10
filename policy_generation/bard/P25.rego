package sales_crm_access

default allow = false

allow = true {
    is_sales_user
    is_work_hours
    is_edit_crm_action
}

is_sales_user {
    input.user.department == "Sales"
}

is_work_hours {
    now := time.now_ns() / 1000000000 // Convert to seconds
    current_hour := time.date(now).hour
    current_hour >= 9
    current_hour <= 17
}

is_edit_crm_action {
    input.action == "edit"
    input.resource.type == "crm_record"
}
