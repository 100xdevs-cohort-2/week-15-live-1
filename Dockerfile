
FROM node:20-alpine


WORKDIR /usr/src/app


COPY package*.json ./


RUN npm install


COPY prisma ./prisma


RUN npx prisma generate


COPY tsconfig.json ./
COPY src ./src

# Build the project
RUN npm run build


EXPOSE 3000


CMD ["node", "dist/index.js"]
