FROM node:18-slim

RUN apt-get update && apt-get install -y     wget     gnupg     libnss3     libatk1.0-0     libatk-bridge2.0-0     libcups2     libdrm2     libxkbcommon0     libxcomposite1     libxrandr2     libxdamage1     libxfixes3     libxext6     libx11-6     libxcb1     libglib2.0-0     libx11-xcb1     libxtst6     libasound2     fonts-liberation     libappindicator3-1     libgbm1     libpango-1.0-0     libcairo2     && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
