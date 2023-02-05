FROM alpine:3.16.0 as git

RUN apk add --no-cache \
    git

ARG SHA
RUN git clone https://github.com/prerender/prerender.git /app

#------------------#

FROM node:alpine

RUN export user=prerenderer \
  && addgroup -S $user && adduser -D -S $user -G $user

COPY [ "files/entrypoint.sh", "/usr/local/bin/" ]

RUN apk add --no-cache --no-progress \
    chromium \
    su-exec

COPY --from=git [ "/app", "/app" ]
WORKDIR /app
RUN npm install

COPY [ "files/server.js", "/app/" ]

EXPOSE 3000
WORKDIR /app
ENTRYPOINT [ "entrypoint.sh" ]
CMD ["npm", "start", "server"]