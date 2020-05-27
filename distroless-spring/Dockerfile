# Stage 1: build Spring Boot application
FROM openjdk:11 as builder

WORKDIR /spring

# perform layer caching of dependencies
COPY gradle/ ./gradle/
COPY gradlew ./
COPY build.gradle ./
COPY settings.gradle ./
RUN ./gradlew --no-daemon dependencies

# copy sources and assemble JAR
COPY src/ src/
RUN ./gradlew --no-daemon assemble

# Stage 2: build Distroless runtime image
FROM gcr.io/distroless/java:11
LABEL maintainer="qaware-oss@qaware.de"

EXPOSE 8080
CMD ["distroless-spring.jar"]

# copy JAR from builder stage onto Distroless image
COPY --from=builder /spring/build/libs/distroless-spring.jar /
