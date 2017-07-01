
FROM sonarqube:6.3.1-alpine

ENV SONARQUBE_HOME=/opt/sonarqube

EXPOSE 9000

VOLUME "$SONARQUBE_HOME"

WORKDIR $SONARQUBE_HOME

ENTRYPOINT ["./bin/run.sh"]
