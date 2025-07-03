#Node.js 16 base image
FROM node:16 as build

#Set working directory
WORKDIR /app

#Copy package files and install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps

#Copy the rest of the source code
COPY . .

#Build the React app for production
RUN npm run build

# -------- Serve the built app using NGINX -------- #
#NGINX base image for static file hosting
FROM nginx:alpine

#Copy the React build output into NGINX’s public directory
COPY --from=build /app/build /usr/share/nginx/html


#Expose port 80 to serve the app
EXPOSE 80

#Start NGINX
CMD ["nginx", "-g", "daemon off;"]
