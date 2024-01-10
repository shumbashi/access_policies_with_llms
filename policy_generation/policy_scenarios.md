# Policy Scenarios

| ID | Short Name | Complexity | No. of Attributes | Problem Statement |
| --- | --- | --- | --- | --- |
| PE1 | All View | Simple | 2 | All authenticated users can view public data |
| PE2 | Marketing Edit | Simple | 2 | Users from the "Marketing" department can edit marketing documents |
| PE3 | Clearance Access | Simple | 2 | Employees with a security clearance level of "Confidential" can access classified documents of level "Confidential" or lower |
| PE4 | HR View | Moderate | 3 | Users in the "HR" department with seniority of fewer than 3 years can view but not edit employee records, while users with seniority of 3 years or more can edit employee records but cannot delete them |
| PE5 | Sales CRM | Moderate | 3 | Users from the Sales department can only edit CRM records during work hours from 9 AM to 5 PM  |
| PE6 | Finance Approval | Moderate | 3 | Employees in the "Finance" department can approve budget requests but not exceed a specified limit |
| PE7 | Executives Location | High | 4 | Users with the attribute "Seniority Level" set to "Executive" can access executive-level documents but only if their location is one of the permitted locations (US, Canada, France, or Italy) and only if using a trusted device. |
| PE8 | Leave Approval | High | 4 | All employees can submit leave requests, direct managers can approve them if the leave duration is less than 4 days, otherwise only HR manager can approve them. |
| PE9 | R&D | High | 5 | Users from the "Research and Development" department can access source code repositories and contribute to projects if the project has the tag type=RND and only during working hours from 9 AM to 5 PM on days Monday to Friday |
| PE10 | High Security | High | 8 | Only employees with the following attributes: 'Department' set to 'Research and Development,' 'Security Clearance' set to 'Top Secret,' 'Location' set to 'Secure Facility,' 'Project Role' set to 'Lead Researcher,' and 'Work Schedule' set to 'Full-Time' are granted access to highly confidential research projects during regular business hours. |