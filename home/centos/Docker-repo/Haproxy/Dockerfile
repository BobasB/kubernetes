FROM centos:7

RUN yum install haproxy -y

ADD ./MariaDB.repo /etc/yum.repos.d/MariaDB.repo

RUN yum install MariaDB-client -y

ADD /haproxy.cfg /etc/haproxy/haproxy.cfg
RUN chmod +r /etc/haproxy/haproxy.cfg

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306 8080

CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]

