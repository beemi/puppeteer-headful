# Puppeteer Headful GitHub Actions

This repository contains the [puppeteer](https://developers.google.com/web/tools/puppeteer) Headful docker image, Container is avilabel to Github Actions

## Usage
```
on:
  pull_request:
    branches:
      - dev
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - name: Build project
        uses: actions/setup-node@v1
        env:
          PUPPETEER_SKIP_CHROMIUM_DOWNLOAD: 'true'
        with:
          args: install
     - name: Smoke tests
        uses: beemi/puppeteer-headful@master
        env:
          CI: 'true'
          DISPLAY: :99
        with:
          args: npm test   

```




Puppeteer Browser launch configuration.

```
browser = await puppeteer.launch({
  args: ['--no-sandbox','--disable-setuid-sandbox','--font-render-hinting=none'],
  executablePath: process.env.PUPPETEER_EXEC_PATH, // set by docker container
  headless: false,
  ...
});

```

# contact
[beemi.raja@gmail.com](beemi.raja@gmail.com)
