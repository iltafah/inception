FROM alpine:3.19

RUN apk upgrade && apk update

RUN apk add apache2-utils

RUN wget "https://github.com/portainer/portainer/releases/download/2.19.5/portainer-2.19.5-linux-amd64.tar.gz" \
        && tar -xvzf portainer-2.19.5-linux-amd64.tar.gz

# RUN echo -n `htpasswd -nb -B admin "${ADMIN_PASS}" | cut -d ":" -f 2` > /tmp/portainer_password
RUN echo -n "uWu1337uWu,BecausePortainerRequiresStrongPass" > /tmp/portainer_password

CMD ./portainer/portainer -p 0.0.0.0:4242 -H unix:///var/run/docker.sock --admin-password-file /tmp/portainer_password

EXPOSE 4242
