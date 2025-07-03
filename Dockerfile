#Node.js 16 base image
FROM node:16

#Set working directory inside the container
WORKDIR /app

#Copy only package.json and package-lock.json
COPY package*.json ./

#Install backend dependencies
RUN npm install

#Copy the entire backend code into container
COPY . .

#Expose the port the app runs on 
EXPOSE 5001

#Define the command to run the app
CMD ["npm", "run", "server"]
