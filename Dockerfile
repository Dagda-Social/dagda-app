FROM nginx

# Setup 
RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl python3 && apt-get upgrade -y && rm -rf /var/cache/apt

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter channel stable
RUN flutter upgrade
RUN flutter doctor -v

# Copy files to container and get dependencies
COPY . /usr/local/bin/app
WORKDIR /usr/local/bin/app
RUN flutter pub get
RUN flutter build web

# Copy build to nginx
RUN  ["cp","-a", "build/web/.", "/usr/share/nginx/html"]
RUN ["cp", "nginx.conf", "/etc/nginx/conf.d/default.conf"]
RUN ["/etc/init.d/nginx","restart"]

# Document the exposed port and start serser
EXPOSE 8080
EXPOSE 80
RUN ["chmod", "+x", "/usr/local/bin/app/server/server.sh"]
ENTRYPOINT [ "sh", "/usr/local/bin/app/server/server.sh" ]