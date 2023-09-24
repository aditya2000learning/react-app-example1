FROM node:lts-alpine3.17 as build
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build/* /usr/share/nginx/html