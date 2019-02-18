FROM alpine:3.7
RUN apk update
RUN apk add nodejs graphicsmagick g++ make ffmpeg
RUN npm install -g yarn

ADD . /opt/app/
WORKDIR /opt/app
RUN yarn
RUN yarn:lint
RUN yarn:lint-web

CMD ["yarn", "start", "/cache/config.json"]
