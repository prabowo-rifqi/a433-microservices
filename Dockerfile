# Gunakan image base
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Salin package.json dan install dependensi
COPY package*.json ./
RUN npm install

# Salin kode aplikasi
COPY . .

# Expose port aplikasi
EXPOSE 3001

# Jalankan aplikasi
CMD ["npm", "start"]