
FROM java:8

EXPOSE 8080

COPY docker-entrypoint.sh /usr/local/bin/

RUN \
    chmod +x /usr/local/bin/docker-entrypoint.sh && \
    curl -L https://github.com/gitbucket/gitbucket/releases/download/4.13/gitbucket.war -o /opt/gitbucket.war && \
    ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["java", "-jar", "/opt/gitbucket.war"]
