*** Settings ***
Documentation      Example tests for HSL APIs
Resource           ${CURDIR}/../resources/common.resource

Force Tags        api
    
*** Test Cases ***
Request Stop With Attributes
    [Documentation]    Gets a stop with given attributes and verifies that the response has them.
    [Tags]    routing-api
    ${query}    Generate Stop Query    HSL:1173434    name    lat    lon
    ${headers}    Create Dictionary    Content-Type=application/graphql    digitransit-subscription-key=${APIKEY}
    ${r}    POST    ${ROUTING_API_URL}    data=${query}    headers=${headers}
    Validate Json By Schema File    ${r.json()}    ${CURDIR}/../resources/schemas/stop_schema.json

Get Places For Given Coordinates
    [Documentation]    Gets 5 closest places based on given coordinates and checks 5 is returned.
    [Tags]    geocoding-api
    ${url_params}    Set Variable    point.lat=60.170278&point.lon=24.9369448&size=5
    ${headers}    Create Dictionary    digitransit-subscription-key=${APIKEY}
    ${r}    GET    ${GEOCODING_API_URL}${GEOCODING_REVERSE_ENDPOINT}   params=${url_params}    headers=${headers}
    Log    ${r.text}
    ${properties}    Get Value From Json    ${r.json()}    $..properties
    Should Be True    len(${properties}) == 5