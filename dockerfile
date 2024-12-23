# Use an official Node.js image as a base
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Clean npm cache and install dependencies
RUN npm install --registry=https://registry.npmjs.org
RUN npm cache clean --force && npm install --verbose

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on (default for Node.js apps is 3000)
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
