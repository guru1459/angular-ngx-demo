# base image
FROM node:9.6.1

# set working directory (also creates two folders needed for cypress)
RUN mkdir /usr/src/app
RUN mkdir /usr/src/app/cypress
RUN mkdir /usr/src/app/cypress/plugins
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json
RUN npm install --silent

# start app
CMD ["npm", "run", "docker-start"]