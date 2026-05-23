FROM eclipse-temurin:8-jre-alpine
COPY biblivre5.war /app/biblivre.war
WORKDIR /app
CMD ["java", "-jar", "biblivre.war"]
