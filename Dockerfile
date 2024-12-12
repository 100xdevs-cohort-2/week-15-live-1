   
#Creating docker file 
#Base image 
FROM node:20

# Working directry
WORKDIR /app

# Copy over file 
COPY . . 

# Run commands to build the code 
RUN npm install
RUN npm run build 
RUN npx prisma generate 


# env variable adding
# do not pass env variable in docker file instead use this in runtime 

# Exports port 
EXPOSE 3000 

# Final command that runs while running the container 
CMD ["node" , "dist/index.js"]


