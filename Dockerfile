FROM eclipse-temurin:latest AS build

WORKDIR /app

COPY . .

RUN ./gradlew build -x test

FROM eclipse-temurin:latest

WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
