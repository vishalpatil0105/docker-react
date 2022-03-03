FROM node:13.12.0-alpine as base_file
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=base_file /app/build /usr/share/nginx/html
