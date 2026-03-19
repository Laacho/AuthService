FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY target/auth-service-0.0.1-SNAPSHOT.jar auth-service.jar
EXPOSE 8081

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8761/actuator/health || exit 1


ENTRYPOINT ["java", "-jar", "auth-service.jar"]