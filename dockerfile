# Use a stable Node.js image (LTS version)
FROM node:lts

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Clear npm cache and install npm globally with verbose logging
USER root  # Ensure we have root privileges for global npm installs
RUN npm cache clean --force && npm install -g npm@latest --verbose
USER node  # Optional: Switch back to non-root user if required

# Install dependencies from package.json
RUN npm install --verbose

# Copy the rest of the application code
COPY . .

# Expose the app's port (default for Node.js apps is 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
