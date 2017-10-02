FROM tomcat:7.0

ADD tomcat.conf /usr/local/tomcat/conf/tomcat.conf

ADD tomcat-users.xml  /usr/local/tomcat/conf/tomcat-users.xml

VOLUME /usr/local/tomcat/webapps
ADD lv254.war /usr/local/tomcat/webapps/lv254.war

EXPOSE 8080

#ADD entrypoint.sh /
#RUN chmod +x /entrypoint.sh


#ENTRYPOINT ["/usr/sbin/tomcat", "start"]

CMD ["catalina.sh", "run"]
