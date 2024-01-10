package access_control

default allow = false

allow = true {
    employee := input.employee
    document := input.document

    employee_clearance := data.employees[employee].clearance
    document_classification := data.documents[document].classification

    employee_clearance >= document_classification
}
