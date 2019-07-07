const puppeteer = require('puppeteer');
const url_base = process.env.APP_URL_BASE;
const admin_password = process.env.ADMIN_PASSWORD;

/* ... */
const browser = await puppeteer.launch(browser_option);
const page = await browser.newPage();
await page.goto(url_base, {waitUntil: 'networkidle2'});
await page.type('#username', 'admin');
await page.type('#password', admin_password);
await Promise.all([
    page.click('#signin_submit'),
    page.waitForNavigation()
]);
await page.goto(`${url_base}/articles/${article_key}`, {waitUntil: 'networkidle2'});                
await page.waitFor(3000);
await browser.close();            
/* ... */