# Use the official Node.js 16.x LTS image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package.json package-lock.json* ./

# Install project dependencies
RUN npm ci --production

# Copy the rest of the application code
COPY . .

# Build the TypeScript app
# RUN npm run build

# Expose the desired port (change the port number if necessary)
EXPOSE 3000

# Start the application
# CMD [ "node", "dist/index.js" ]
CMD [ "npx",  "ts-node", "app.ts" ]
