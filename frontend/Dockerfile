# Stage 1: Build frontend
FROM node:18-alpine AS build

WORKDIR /app
ENV BACKEND_SERVER="localhost"
# Install dependencies
COPY package.json .
RUN npm install

# Copy the source code and build the app
COPY src ./src
COPY ./webpack.config.js ./babel.config.json ./
RUN npm run build

# Stage 2: Serve the app with nginx
FROM nginx:alpine

# Copy the built React app to the nginx directory
COPY --from=build /app/build /app/src/index.html /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]