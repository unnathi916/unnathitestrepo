# Step 1: Use an official Node.js image as a base
FROM node:18

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy the package.json and package-lock.json (if available)
# This allows Docker to install dependencies without having to copy the entire codebase
COPY package*.json ./

# Step 4: Install the dependencies defined in package.json
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Expose the port the app will run on (default for Node.js apps is 3000)
EXPOSE 3000

# Step 7: Define the command to run the app
CMD ["npm", "start"]
