FROM nginx:latest

COPY index.html /usr/share/nginx/html
COPY linux.png /usr/share/nginx/html

EXPOSE 80 443 8080 9000

CMD ["nginx", "-g", "daemon off;"]
