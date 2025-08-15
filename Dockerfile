FROM node:22-slim AS base

FROM base AS deps
WORKDIR /app
COPY package*.json /app/
RUN npm ci

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules /app/node_modules
COPY . . 
RUN npm run build

FROM base AS runtime
WORKDIR /app 
COPY --from=builder --chown=node:node /app/.next/standalone ./
COPY --from=builder --chown=node:node /app/public ./public
COPY --from=builder --chown=node:node /app/.next/static ./

ENV NEXT_TELEMETRY_DISABLED=1
ENV NODE_ENV=production

ENV HOSTNAME="0.0.0.0"
ENV PORT=3000

EXPOSE 3000
USER node
CMD ["node", "server.js"]
