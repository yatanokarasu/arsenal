
FROM java:8

EXPOSE 4440

COPY docker-entrypoint.sh /usr/local/bin/

RUN \
    chmod +x /usr/local/bin/docker-entrypoint.sh && \
    mkdir -p /opt/rundeck  && \
    cd /opt/rundeck && \
    curl -LO http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-2.8.2.jar && \
    ln -s rundeck-launcher-2.8.2.jar rundeck.jar && \
    java -jar rundeck.jar --installonly && \
    sed -i \
        -e '/^grails.serverURL/s!http.*!http://localhost/rundeck!' \
        -e '/dataSource.url/s!jdbc.*!jdbc:mysql://mysql-server/rundeck?useSSL=false\&useUnicode=true\&characterEncoding=utf8\&rewriteBatchedStatements=true\&autoReconnect=true!' \
        -e '/dataSource.url/a\dataSource.password = rundeck' \
        -e '/dataSource.url/a\dataSource.username = rundeck' \
        /opt/rundeck/server/config/rundeck-config.properties

VOLUME /etc/rundeck

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["java", "-Dserver.web.context=/rundeck", "-jar", "/opt/rundeck/rundeck.jar"]
