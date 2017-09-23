FROM node:alpine

MAINTAINER ouaghad.hamza@gmail.com

# To add package.json to /tmp and have node_modules there would make use of
# docker layers, as to not have to reinstall the app dependencies on every build
ADD package.json /tmp
RUN cd /tmp && npm install

# it's FHS compliant to put the source code of the app in /usr/src
RUN mkdir -p /usr/src/app && cp -a /tmp/node_modules /usr/src/app

WORKDIR /usr/src/app
ADD . /usr/src/app

EXPOSE 3000 443

CMD ["npm", "start"]
