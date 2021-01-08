FROM alpine:3.12

RUN apk add --no-cache samba-server

ADD smb.conf /etc/samba/smb.conf

EXPOSE 445:445 139:139/udp

RUN mkdir -m 0777 -p /share; 

CMD ["/usr/sbin/smbd","--foreground", "--interactive"] 

