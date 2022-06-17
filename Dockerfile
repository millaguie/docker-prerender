FROM node:alpine

ENV DISPLAY :99.0

WORKDIR /app

RUN addgroup -S prerender && adduser -S -g prerender prerender  && \
    apk add --no-cache ca-certificates && \
    apk add chromium --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community && \
    npm install prerender  && \
    npm install prerender-memory-cache && \
    rm -rf /var/cache/apk/*

COPY server.js /app/server.js

USER prerender

EXPOSE 3000

CMD [ "node", "server.js" ]

