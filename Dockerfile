# Use the official Node.js 16.x LTS image as the base image
FROM node:18-alpine

# Install curl
RUN apk add --no-cache curl
RUN apk add --no-cache bash


# Set the NODE_ENV environment variable to production
ARG RAILWAY_ENVIRONMENT
ENV RAILWAY_ENVIRONMENT=$RAILWAY_ENVIRONMENT
ARG PORT
ENV PORT=$PORT
ARG REDIS_URL
ENV REDIS_URL=$REDIS_URL

RUN curl -Ls https://download.newrelic.com/install/newrelic-cli/scripts/install.sh | bash && sudo NEW_RELIC_API_KEY=NRAK-NCJ14874WWZ9I2HDW3N41LZFN9J NEW_RELIC_ACCOUNT_ID=3948142 /usr/local/bin/newrelic install -n logs-integration

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
CMD [ "node", "-r", "newrelic", "dist/app.js" ]
# CMD [ "npx",  "ts-node", "app.ts" ]
