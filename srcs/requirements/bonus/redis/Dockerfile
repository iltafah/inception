FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add redis

CMD redis-server --protected-mode no

EXPOSE 6379
