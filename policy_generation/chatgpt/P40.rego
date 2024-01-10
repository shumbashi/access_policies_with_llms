package main

default allow = false

allow {
    input.user.attributes["Seniority Level"] == "Executive"
    input.user.attributes["Location"][_] == permittedLocation
    input.user.attributes["Device"] == "Trusted"
    input.document.level == "Executive"
}

permittedLocation = "US"
permittedLocation = "Canada"
permittedLocation = "France"
permittedLocation = "Italy"
