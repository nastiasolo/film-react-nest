
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .
RUN yarn build

FROM node:20-alpine AS runner

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY wait-for.sh ./
RUN chmod +x wait-for.sh

EXPOSE 3000

CMD ["./wait-for.sh", "postgres:5432", "--", "yarn", "start:prod"]
