FROM openjdk:17.0.1-jdk-slim

ADD target/demo-0.0.1.jar /app.jar
EXPOSE 8082
CMD  java -jar /app.jar
