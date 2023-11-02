FROM node:12
WORKDIR /home/node/app

COPY app /home/node/app

RUN npm install

EXPOSE 9999

CMD npm run app