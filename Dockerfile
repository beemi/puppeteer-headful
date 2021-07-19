FROM node:16.5.0

RUN  apt-get update \
     && apt-get install -y wget gnupg \
     && apt-get install -yq libgconf-2-4 \
     && apt-get install -y wget xvfb --no-install-recommends \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
     && apt-get update \
     && apt-get install -y chromium google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
        --no-install-recommends \
     && rm -rf /var/lib/apt/lists/*

COPY pin_nodesource /etc/apt/preferences.d/nodesource
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Run everything after as non-privileged user.
USER pptruser

COPY README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
