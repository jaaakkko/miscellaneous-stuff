*** Settings ***
Resource           ${CURDIR}/../resources/common.resource
*** Variables ***
${LOC_BTN_DECLINE_COOKIES}            text=Vain välttämättömät

${LOC_BTN_ONETIME_TICKETS}            text=Kertaliput
${LOC_BTN_CUSTOMER_TYPE_DROPDOWN}     button#asiakasryhma-toggle-button
${LOC_SELECT_CUSTOMER_TYPE}           //ul[@id="asiakasryhma-menu"]
${LOC_BTN_ZONE_DROPDOWN}              button#vyohykkeet-toggle-button
${LOC_SELECT_ZONE}                    //ul[@id="vyohykkeet-menu"]
${LOC_TICKET_PRICE}                   //div[contains(@class, "ticketItemColumnPrice") and contains(@class, "SinglePurchaseTicketItem")]


*** Keywords ***
Decline Cookies
    Click    ${LOC_BTN_DECLINE_COOKIES}

Click One Time Tickets
    Click    ${LOC_BTN_ONETIME_TICKETS}
Get Ticket Price With Selections
    [Arguments]    ${customer_type}    ${zone}
    Click    ${LOC_BTN_CUSTOMER_TYPE_DROPDOWN}
    Click    ${LOC_SELECT_CUSTOMER_TYPE}/li[contains(text(), "${customer_type}")]
    Click    ${LOC_BTN_ZONE_DROPDOWN}
    Click    ${LOC_SELECT_ZONE}/li[text()="${zone}"]
    ${price}    Get Text    ${LOC_TICKET_PRICE}
    RETURN    ${price}