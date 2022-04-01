FROM node:14-alpine as builder
WORKDIR '/app'
COPY package.json .

RUN npm install
#RUN npm install --save react@latest
#RUN npm install --save react-scripts@latest

COPY . .
#ENV PATH /app/node_modules/.bin:$PATH
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html