FROM node:16.5.0

MAINTAINER Beemi Raja <beemi.raja@gmail.com>

RUN  apt-get update \
     && apt-get install -y wget gnupg \
     && apt-get install -yq libgconf-2-4 \
     && apt-get install -y ca-certificates wget xvfb dbus dbus-x11 build-essential --no-install-recommends \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
     && apt-get update \
     && apt-get install -y chromium google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
        --no-install-recommends \
     && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

COPY README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
