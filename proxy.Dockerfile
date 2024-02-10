FROM nginx:1

COPY proxy/proxy.conf /etc/nginx/conf.d/proxy.conf
COPY proxy/index.html /etc/nginx/public/index.html
COPY proxy/js /etc/nginx/public/js
COPY proxy/css /etc/nginx/public/css
COPY proxy/image /etc/nginx/public/image
