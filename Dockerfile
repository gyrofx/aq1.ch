FROM node:22 AS build

RUN mkdir -p /app
WORKDIR /app

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.138.0/hugo_0.138.0_linux-amd64.deb
RUN dpkg -i hugo_0.138.0_linux-amd64.deb

COPY package.json yarn.lock /app/
RUN yarn install

COPY . /app
RUN ls -la
RUN yarn build

FROM nginx:alpine

COPY --from=build /app/public /usr/share/nginx/html
COPY ./assets/images/bg.jpg /usr/share/nginx/html/images/
