FROM node:current-alpine3.22 as base
WORKDIR /app
COPY --chown=node:node package.json yarn.lock /app/
RUN chown node:node /app
USER node

FROM base AS Prod
COPY --chown=node:node src /app/src
ENV SQLITE_DB_LOCATION=/tmp/todo.db
RUN yarn install --production && yarn cache clean
CMD [ "node", "src/index.js" ]

FROM prod as dev
RUN yarn install && yarn cache clean
CMD [ "yarn", "dev" ]

FROM dev as test
ENV SQLITE_DB_LOCATION=/tmp/todo.db
COPY --chown=node:node spec /app/spec
RUN yarn install && yarn cache clean
CMD [ "yarn","test" ]