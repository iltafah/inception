# FROM alpine
# RUN     apk add doas; \
#         adduser tofaha -G wheel; \
#         echo 'tofaha:123' | chpasswd; \
#         echo 'permit :wheel as root' > /etc/doas.d/doas.conf
# USER tofaha
# CMD tail -f /dev/null

FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add lftp vsftpd

RUN adduser -D tofaha 
RUN echo tofaha:1337 | chpasswd 

RUN \
        echo "listen=YES" > /etc/vsftpd/vsftpd.conf; \
        echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf; \
        echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf; \
        echo "anonymous_enable=NO" >> /etc/vsftpd/vsftpd.conf; \
        echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf; \
        echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf; \
        echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf; \
        echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf; \
        echo "pasv_min_port=41337" >> /etc/vsftpd/vsftpd.conf; \
        echo "pasv_max_port=41337" >> /etc/vsftpd/vsftpd.conf;

CMD vsftpd /etc/vsftpd/vsftpd.conf

EXPOSE 21