# Stage 1: build Jakarta EE web application
FROM openjdk:11-buster as builder

WORKDIR /payara

# perform layer caching of dependencies
COPY gradle/ ./gradle/
COPY gradlew ./
COPY build.gradle ./
COPY settings.gradle ./
RUN ./gradlew --no-daemon dependencies

# build the war artifact
COPY src/ src/
RUN ./gradlew --no-daemon assemble

# Stage 2: build Distroless runtime image
FROM gcr.io/distroless/java:11
LABEL maintainer="qaware-oss@qaware.de"

ENV PAYARA_PATH /opt/payara
ENV DEPLOY_DIR $PAYARA_PATH/deployments

COPY --from=payara/micro:5.201 /etc/passwd /etc/passwd
COPY --from=payara/micro:5.201 /etc/group /etc/group
COPY --from=payara/micro:5.201 $PAYARA_PATH $PAYARA_PATH

USER payara
WORKDIR $PAYARA_PATH

EXPOSE 8080 8443 6900

ENTRYPOINT ["java", "-server", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=50.0", "-XX:ThreadStackSize=256", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=250", "-XX:+UseStringDeduplication", "-jar", "/opt/payara/payara-micro.jar"]
CMD ["--nocluster", "--disablephonehome", "--deploymentDir", "/opt/payara/deployments"]

COPY --from=builder /payara/build/libs/distroless-payara.war $PAYARA_PATH/deployments
