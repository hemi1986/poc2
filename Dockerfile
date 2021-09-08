FROM node:12-alpine

WORKDIR /app
COPY . .
RUN npm install
RUN npm build
CMD npm start:prod