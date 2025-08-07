FROM node:current-alpine3.22 as base
WORKDIR /app/
COPY --chown=node:node package.json yarn.lock /app/
RUN chown node:node /app/
USER node

FROM base AS build
COPY --chown=node:node src /app/src
COPY --chown=node:node public /app/public
RUN yarn install --frozen-lockfile --silent && yarn cache clean --silent
RUN yarn build

FROM nginx:alpine AS prod
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
