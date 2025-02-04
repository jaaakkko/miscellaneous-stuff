*** Settings ***
Resource           ${CURDIR}/../resources/common.resource
Resource          ${CURDIR}/../resources/ui.resource

Suite Setup    New Browser    ${BROWSER}    headless=${HEADLESS}

Force Tags        ui

*** Test Cases ***
Verify HSL Page Opens
    [Tags]    hsl
    New Page    ${HSL_URL}
    Take Screenshot
    Accept Cookies
    Wait For Elements State    ${LOC_MAIN_NAV_BAR}    visible

Verify HSL One Time Ticket Price
    [Documentation]    Verifies that the price of a one time ticket for adult is 3.20€
    [Tags]    hsl
    New Page    ${HSL_TICKETS_URL}
    Accept Cookies
    Click One Time Tickets
    ${ui_price}    Get Ticket Price With Selections    Aikuinen    AB
    Should Be Equal As Strings    ${ui_price}    3,20 €

Test Accessing Google
    New Page    https://www.google.com
    Take Screenshot
