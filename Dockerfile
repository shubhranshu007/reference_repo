# Use official Node.js LTS base image
FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies (only production deps)
RUN npm install --production

# Copy the rest of the source code
COPY . .

# Expose the app port (change if your app uses a different one)
EXPOSE 3000

# Start the Node.js app
CMD ["npm", "start"]
