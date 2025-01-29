*** Settings ***
Resource           ${CURDIR}/../resources/common.resource
Resource          ${CURDIR}/../resources/ui.resource

Suite Setup    New Browser    ${BROWSER}    headless=${False}

Force Tags        ui

*** Test Cases ***
Verify HSL One Time Ticket Price
    [Documentation]    Verifies that the price of a one time ticket for adult is 3.20€
    New Page    ${HSL_TICKETS_URL}
    Decline Cookies
    Click One Time Tickets
    ${ui_price}    Get Ticket Price With Selections    Aikuinen    AB
    Should Be Equal As Strings    ${ui_price}    3,20 €