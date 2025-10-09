# Use official Node LTS
FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy app source
COPY . .

# Expose Cloud Run port
ENV PORT=8080
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
