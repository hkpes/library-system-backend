# ---- Build Stage ----
FROM maven:3.8.6-eclipse-temurin-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests -B

# ---- Run Stage ----
FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=build /app/target/LibraryManagerApi-1.0-SNAPSHOT.jar app.jar

EXPOSE 9361

ENTRYPOINT ["java", "-jar", "app.jar"]
