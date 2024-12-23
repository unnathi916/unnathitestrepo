# Use the official Node.js image
FROM node:lts

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --verbose

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on (default for Node.js apps is 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
