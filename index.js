require("prerender")({
	chromeFlags: [
		"--headless",
		"--remote-debugging-port=9222",
		"--hide-scrollbars",
	],
	followRedirects: true,
}).start();
