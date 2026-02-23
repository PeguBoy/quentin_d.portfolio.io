FROM debian:12
WORKDIR /home
RUN apt update \
&& apt install -y nginx
CMD ["nginx", "-g", "daemon off;"]
