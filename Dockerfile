# Gunakan image node sebagai base image
FROM node:18-alpine 

# Set working directory dalam container
WORKDIR /app

# Copy file package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Install dependencies
RUN npm install 

# Copy seluruh project ke dalam container
COPY . .

# Build aplikasi React
RUN npm run build 

# Install 'serve' untuk menjalankan aplikasi React
RUN npm install -g serve

# Ekspos port 3000
EXPOSE 3003

# Perintah untuk menjalankan aplikasi saat container dijalankan
CMD ["serve", "-s", "build", "-l", "3003"]
