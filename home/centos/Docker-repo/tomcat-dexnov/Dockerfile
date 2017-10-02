FROM centos:7

RUN yum install -y epel-release tomcat tomcat-webapps tomcat-admin-webapps 
RUN yum update -y && yum clean all;
ADD tomcat.conf /etc/tomcat/tomcat.conf

ADD tomcat-users.xml  /etc/tomcat/tomcat-users.xml

VOLUME /var/tomcat/webapps
ADD lv254.war /var/tomcat/webapps/lv254.war

EXPOSE 8080

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

#ENTRYPOINT ["/usr/sbin/tomcat", "start"]
ENTRYPOINT  ["/bin/bash"]
