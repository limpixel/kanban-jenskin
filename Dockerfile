# Gunakan image dasar Nginx untuk aplikasi static web
FROM nginx:latest

# Salin semua file HTML, CSS, dan JS ke dalam direktori default Nginx
COPY . /usr/share/nginx/html

# Expose port 80 agar dapat diakses
EXPOSE 8080

# Jalankan Nginx dalam mode foreground
CMD ["nginx", "-g", "daemon off;"]
