FROM node:17.0.1

# Create app directory
WORKDIR /usr/src/app

# Wildcard to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Dev build
# RUN npm install

# If you are building your code for production
RUN npm ci --only=production
# Unlike npm install, npm ci will never modify your package-lock.json
# It does however expect a package-lock. json file in your project
# npm ci: CI stands for continuous integration and npm ci is used to install all exact version dependencies

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]