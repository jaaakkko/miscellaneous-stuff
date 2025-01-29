import { test, expect } from '@playwright/test';

const APIKEY = 'insert-your-api-key-here';
const ROUTING_API_URL = 'https://api.digitransit.fi/routing/v2/hsl/gtfs/v1'
const GEOCODING_API_URL = 'http://api.digitransit.fi/geocoding/v1'
const GEOCODING_REVERSE_ENDPOINT = '/reverse'

test.describe('HSL Routing API', () => {

    test('should not return data without API key', async ({ request }) => {
        const r = await request.post(`${ROUTING_API_URL}`);
        expect(r.status()).toBe(401);
    });

    test('should return stop data',async ({ request }) => {
        const headers = {
            'Content-Type': 'application/graphql',
            'digitransit-subscription-key': APIKEY
        };
        const query = `
        {
          stop(id: "HSL:1173434") {
            name
            lat
            lon
          }
        }`;
        const r = await request.post(`${ROUTING_API_URL}`, {
            headers,
            data: query
        });
        console.log(`Response status: ${r.status()}`);
        expect(r.status()).toBe(200);
        const responseData = await r.json();
        console.log('Response data', responseData);
        expect(responseData.data.stop.name).toBeDefined();
        expect(responseData.data.stop.lat).toBeDefined();
        expect(responseData.data.stop.lon).toBeDefined();
    });
});

test.describe('HSL Geocoding API', () => {

    test('should return 5 places based on location', async ({ request }) => {
        const headers = {
            'digitransit-subscription-key': APIKEY
        };
        const url_params = 'point.lat=60.170278&point.lon=24.9369448&size=5';
        const r = await request.get(`${GEOCODING_API_URL}${GEOCODING_REVERSE_ENDPOINT}`, {
            headers,
            params: url_params
        });
        expect(r.status()).toBe(200);
        const responseData = await r.json();
        console.log('Response data', responseData);
        expect(responseData.features.length).toBe(5);
    });
});