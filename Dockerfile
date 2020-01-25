FROM node:current-alpine3.10
WORKDIR /build
COPY ./example/nsfw_demo /build
RUN npm install && npm run build

FROM suika/nweb:3.10
COPY --from=1 /build/build /app
