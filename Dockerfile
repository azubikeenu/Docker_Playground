#Define the builder phase
FROM node:14-alpine as builder

WORKDIR  /usr/app/

COPY  package.json .

RUN npm install

COPY . .

RUN npm run build

# The run phase
FROM nginx
COPY --from=builder /usr/app/build  /usr/share/nginx/html
