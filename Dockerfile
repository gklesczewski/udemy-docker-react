# Production DockerFile for the CICD builder

# Build the client code.
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Build the production image.
FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html
