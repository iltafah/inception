FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add openrc vim lftp vsftpd

ARG FTP_USER
ENV FTP_USER=${FTP_USER}

RUN echo $FTP_USER

RUN adduser -D $FTP_USER
RUN echo $FTP_USER:$FTP_USER_PASS | chpasswd

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
EXPOSE 41337


#problem of vsftpd not startting with rc-service
#try mkdir /run/openrc/exclusive
