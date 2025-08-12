FROM node:22-slim AS base 

FROM base AS deps
WORKDIR /app 
COPY package*.json /app/
RUN npm ci

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM base AS runtime
WORKDIR /app
COPY --from=builder --chown=node:node /app/.output ./

ENV NODE_ENV=production
ENV NUXT_ENVIRONMENT=production
ENV NUXT_TELEMETRY_DISABLED=1
ENV NITRO_HOST=0.0.0.0
ENV NITRO_PORT=3030
USER node


EXPOSE 3030
CMD [ "node","server/index.mjs" ]

