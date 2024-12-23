# Use an official Node.js image as a base
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install npm with the latest version
RUN npm install -g npm@latest --verbose

# Clean npm cache and install dependencies with verbose output
RUN npm cache clean --force && npm install --verbose --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on (default for Node.js apps is 3000)
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
