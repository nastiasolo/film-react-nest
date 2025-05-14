
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN yarn install 

COPY . .

RUN yarn build

FROM node:20-alpine AS runner

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

EXPOSE 3000

CMD ["postgres:5432", "--", "yarn", "start:prod"]
