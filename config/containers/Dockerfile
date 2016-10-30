FROM nginx:stable
RUN apt-get update -qq && apt-get -y install apache2-utils
ENV RAILS_ROOT /var/www/makgoradota2
WORKDIR $RAILS_ROOT
RUN mkdir log
COPY public public/
COPY config/containers/nginx.conf /tmp/makgoradota2.nginx
RUN envsubst '$RAILS_ROOT' < /tmp/makgoradota2.nginx > /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]