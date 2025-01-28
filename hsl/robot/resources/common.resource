*** Settings ***
Library           Browser
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           ${CURDIR}/../libs/queries.py

*** Variables ***
${APIKEY}                             insert-your-api-key-here

${ROUTING_API_URL}                    https://api.digitransit.fi/routing/v2/hsl/gtfs/v1
${GEOCODING_API_URL}                  http://api.digitransit.fi/geocoding/v1
${GEOCODING_REVERSE_ENDPOINT}         /reverse

${BROWSER}                            chromium
${HSL_URL}                            https://www.hsl.fi
${HSL_TICKETS_URL}                    ${HSL_URL}/liput-ja-hinnat

*** Keywords ***

