
FROM koda/docker-knowledge

EXPOSE 8080

RUN mv /usr/local/tomcat/webapps/ROOT.war /usr/local/tomcat/webapps/knowledge.war

VOLUME /root/.knowledge

CMD ["/usr/local/bin/dumb-init", "/usr/local/tomcat/bin/catalina.sh", "run"]
