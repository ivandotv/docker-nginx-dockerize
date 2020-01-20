FROM nginx:latest

ENV DOCKERIZE_VERSION v0.6.1

RUN apt-get update && \
    apt-get install -y  \
    wget && \
    rm -rf /var/lib/apt/lists/*


RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz


COPY ./build-assets/default.conf /etc/nginx/conf.d/

COPY ./build-assets/nginx.conf /etc/nginx/nginx.conf

COPY ./build-assets/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]
