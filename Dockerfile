# Specifies where to get the base image (Node v12 in our case) and creates a new container for it
FROM node:15

# Set working directory. Paths will be relative this WORKDIR.
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

# Install dependencies
COPY package.json ./app/package.json
RUN npm install

# Copy source files from host computer to the container
COPY . .

# Build the app
RUN npm run build

# Specify port app runs on
EXPOSE 3000

# Run the app
CMD [ "npm", "start" ]