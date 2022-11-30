FROM nginx

# Setup 
RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl python3 && apt-get upgrade -y && rm -rf /var/cache/apt


# Copy files to container and get dependencies
COPY . /usr/local/bin/app
WORKDIR /usr/local/bin/app

# Copy build to nginx
RUN  ["cp","-a", "/usr/local/bin/app", "/usr/share/nginx/html"]
RUN ["cp", "nginx.conf", "/etc/nginx/conf.d/beta.dagda.social.conf"]
RUN ["/etc/init.d/nginx","restart"]

# Document the exposed port and start serser
EXPOSE 8080
EXPOSE 80
RUN ["chmod", "+x", "/usr/local/bin/app/server/server.sh"]
ENTRYPOINT [ "sh", "/usr/local/bin/app/server/server.sh" ]