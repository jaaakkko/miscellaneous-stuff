*** Settings ***
Documentation      Example tests for HSL APIs
Resource           ${CURDIR}/../resources/common.resource

Library    Collections
Force Tags        api
*** Variables ***

    
*** Test Cases ***
Request Stop With Attributes
    [Tags]    routing-api
    ${query}    Generate Stop Query    HSL:1173434    name    lat    lon
    ${headers}    Create Dictionary    Content-Type=application/graphql    digitransit-subscription-key=${APIKEY}
    ${r}    POST    ${ROUTING_API_URL}    data=${query}    headers=${headers}
    Status Should Be    200
    Validate Json By Schema File    ${r.json()}    ${CURDIR}/../resources/schemas/stop_schema.json

Get Closest Place For Given Coordinates
    [Tags]    geocoding-api
    ${url_params}    Set Variable    point.lat=60.170278&point.lon=24.9369448
    ${headers}    Create Dictionary    digitransit-subscription-key=${APIKEY}
    ${r}    GET    ${GEOCODING_API_URL}${GEOCODING_REVERSE_ENDPOINT}   params=${url_params}    headers=${headers}
    Log    ${r.text}