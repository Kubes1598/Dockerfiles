# Set the base image
ARG NODE_VERSION=18
FROM node:${NODE_VERSION}-alpine AS base

# Set working directory in container
ARG APP_WORKDIR=/usr/src/app
WORKDIR ${APP_WORKDIR}

# Set environment variables
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Install dependencies
COPY package*.json ./
RUN npm install --only=production && npm cache clean --force

# Copy application code
COPY . .

# Expose the application port
ARG APP_PORT=3000
EXPOSE ${APP_PORT}

# Command to run the application
ARG START_SCRIPT="start"
CMD ["npm", "run", "${START_SCRIPT}"]
