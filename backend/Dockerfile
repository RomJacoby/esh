FROM node:18-alpine AS build

WORKDIR /app

# Install backend dependencies
COPY package.json server.js ./
RUN npm install

EXPOSE 8080

# Run backend server
CMD ["npm", "start"]