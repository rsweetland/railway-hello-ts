# Use the official Node.js 16.x LTS image as the base image
FROM node:18-alpine

# Set the NODE_ENV environment variable to production
ARG RAILWAY_ENVIRONMENT
ENV RAILWAY_ENVIRONMENT=$RAILWAY_ENVIRONMENT
ARG PORT
ENV PORT=$PORT
ARG REDIS_URL
ENV REDIS_URL=$REDIS_URL

RUN echo $RAILWAY_ENVIRONMENT

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package.json package-lock.json* ./

# Install project dependencies
# RUN npm ci --production
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the TypeScript app
RUN yarn build
# RUN npm run build

# Expose the desired port (change the port number if necessary)
EXPOSE $PORT

# Start the application
CMD [ "node", "dist/app.js" ]
# CMD [ "npx",  "ts-node", "app.ts" ]
