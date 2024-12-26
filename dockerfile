# Use an official Node.js runtime as a parent image
FROM node:18-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) into the container
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of your application code into the container
COPY . .

# Expose the port your application will run on (adjust if needed)
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
