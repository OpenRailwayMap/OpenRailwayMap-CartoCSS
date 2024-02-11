FROM nginx:1-alpine

COPY proxy/proxy.conf.template /etc/nginx/templates/proxy.conf.template
COPY proxy/index.html /etc/nginx/public/index.html
COPY proxy/js /etc/nginx/public/js
COPY proxy/css /etc/nginx/public/css
COPY proxy/image /etc/nginx/public/image
