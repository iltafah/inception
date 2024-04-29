FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add openrc vim lftp vsftpd

RUN	adduser -D tofaha 
RUN	echo tofaha:1337 | chpasswd

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


#problem of vsftpd not startting with rc-service
#try mkdir /run/openrc/exclusive



# listen=YES
# anonymous_enable=YES
# dirmessage_enable=YES
# use_localtime=YES
# connect_from_port_20=YES
# secure_chroot_dir=/var/run/vsftpd/empty
# write_enable=NO
# seccomp_sandbox=NO
# xferlog_std_format=NO
# log_ftp_protocol=YES
# syslog_enable=YES
# hide_ids=YES
# seccomp_sandbox=NO
# pasv_enable=YES
# port_enable=YES
# anon_root=/var/ftp
# pasv_max_port=65515
# pasv_min_port=65500
# max_per_ip=2
# max_login_fails=2
# max_clients=50
# anon_max_rate=6250000
# ftpd_banner=Welcome to an awesome public FTP Server
# banner_file=
# pasv_address=
# hide_file=
# deny_file=



# anonymous_enable=NO
# local_enable=YES
# write_enable=YES
# chroot_local_user=YES
# #chroot_list_enable=YES
# #chroot_list_file=/etc/vsftpd/chroot_list
# listen=YES
# local_root=/var/ftp/test
# allow_writeable_chroot=YES
# pasv_enable=YES
# file_open_mode=0755
#  connect_from_port_20=YES
#  seccomp_sandbox=NO
#  port_enable=YES
#  pasv_max_port=65515
#  pasv_min_port=65500



# anonymous_enable=NO
# local_enable=YES
# write_enable=YES
# chroot_local_user=YES
# listen=YES
# allow_writeable_chroot=YES
# pasv_enable=YES
#  seccomp_sandbox=NO
#  pasv_max_port=65515
#  pasv_min_port=65500