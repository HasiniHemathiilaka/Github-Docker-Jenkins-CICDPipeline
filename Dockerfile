## 1. Use the lightweight, production-ready Node.js Alpine image as the base image
# This drops the image size by ~900MB, stopping the 'unexpected EOF' and network proxy drops!
FROM node:22-alpine  

# 2. Set the working directory inside the container
WORKDIR /usr/src/app  

# 3. Copy files directly into the active working directory instead of the system root (/)
COPY nodeapp/package*.json ./

# 4. Run the npm install command to install dependencies inside the working directory
RUN npm install  

# 5. Copy the rest of your application code into the working directory
COPY nodeapp/ ./

# 6. Expose port 3000 to allow incoming connections
EXPOSE 3000  

# 7. Start the application by running the start command
CMD [ "npm", "start" ]
