#!/usr/bin/env node
require("./lib")({
  chromeLocation: '/usr/bin/chromium-browser',
	chromeFlags: [
		'--no-sandbox', '--headless', '--disable-gpu', '--disable-software-rasterizer', '--disable-dev-shm-usage', '--remote-debugging-port=9222', '--hide-scrollbars'
	],
	followRedirects: true,
}).start();