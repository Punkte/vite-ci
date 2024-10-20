FROM node:latest AS build

WORKDIR /app

COPY package*.json /app

RUN npm ci

COPY . .

RUN npm run build



FROM nginx:latest

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]