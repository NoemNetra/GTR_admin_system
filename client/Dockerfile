# The Flutter web app is compiled into ./build/web before the image is built.
# Run "flutter build web --release" in this folder (or use ../run-all.ps1) first.
FROM nginx:stable-alpine

RUN rm -rf /usr/share/nginx/html/*
COPY ./build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
