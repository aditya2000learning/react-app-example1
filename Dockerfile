FROM docker.io/node:lts-alpine3.17 as build
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM docker.io/nginx:alpine-slim
COPY --from=build /app/build /usr/share/nginx/html
