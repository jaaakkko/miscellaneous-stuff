import { test, expect } from '@playwright/test'

const HSL_URL = 'https://www.hsl.fi'
const HSL_TICKETS_URL = `${HSL_URL}/liput-ja-hinnat`


test('HSL one time ticket price', async ({ page }) => {
    await page.goto(HSL_TICKETS_URL)
    await page.getByRole('button', { name: 'Vain välttämättömät' }).click();
    await page.getByRole('link', { name: 'Kertaliput Satunnaisille' }).click();
    await expect(page).toHaveURL('https://www.hsl.fi/liput-ja-hinnat/kertaliput');
    await page.getByRole('combobox', { name: 'Asiakasryhmä' }).click();
    await page.getByTestId('dropdown-option-0').click();
    await page.getByRole('combobox', { name: 'Vyöhykkeet' }).click();
    await page.getByTestId('dropdown-option-0').click();
    const priceLocator = await page.locator('//div[contains(@class, "ticketItemColumnPrice") and contains(@class, "SinglePurchaseTicketItem")]')
    const priceText = await priceLocator.textContent();
    console.log('Price text:', priceText);
    expect(priceText).toBe('3,20 €');
});