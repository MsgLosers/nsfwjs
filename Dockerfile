FROM node:current-alpine3.10 as build
WORKDIR /build
COPY ./ /build
RUN yarn prep && cd /build/example/nsfw_demo && yarn install && yarn build

FROM suika/nweb:3.10
COPY --from=build /build/example/nsfw_demo/build /app
