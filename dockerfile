# Menggunakan image dasar Node.js
FROM node:18.20.5

# Menetapkan variabel environment untuk port
ENV PORT 3000

# Salin file package.json dan package-lock.json terlebih dahulu untuk instalasi dependencies
COPY package*.json ./

# Install dependensi yang diperlukan
RUN npm install

# Salin seluruh aplikasi ke dalam container
COPY . .

# Salin file ServiceAccount.json ke dalam container
# Pastikan nama file sesuai dengan yang ada di direktori Anda
COPY ServiceAccount.json ./ServiceAccount.json

# Set environment variable untuk kredensial Firebase
ENV GOOGLE_APPLICATION_CREDENTIALS=./ServiceAccount.json

# Menyediakan port untuk aplikasi
EXPOSE 3000

# Menjalankan aplikasi
CMD ["node", "./src/server/server.js"]