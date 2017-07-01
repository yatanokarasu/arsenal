
FROM koda/docker-knowledge

EXPOSE 8080

VOLUME /root/.knowledge

RUN mv /usr/local/tomcat/webapps/ROOT.war /usr/local/tomcat/webapps/knowledge.war

CMD ["/usr/local/bin/dumb-init", "/usr/local/tomcat/bin/catalina.sh", "run"]
