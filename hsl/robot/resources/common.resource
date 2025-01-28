*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           ${CURDIR}/../libs/queries.py

*** Variables ***
${APIKEY}                             insert-your-api-key-here
${ROUTING_API_URL}                    https://api.digitransit.fi/routing/v2/hsl/gtfs/v1
${GEOCODING_API_URL}                  http://api.digitransit.fi/geocoding/v1
${GEOCODING_REVERSE_ENDPOINT}         /reverse

*** Keywords ***

