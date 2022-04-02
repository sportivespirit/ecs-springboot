FROM openjdk:11-jre-slim@sha256:afbe5f6d76c1eedbbd2f689c18c1984fd67121b369fc0fbd51c510caf4f9544f
RUN mkdir /app
COPY ./target/springboot-practice-0.0.1-SNAPSHOT.jar /app/spring-app.jar
WORKDIR /app
CMD "java" "-jar" "spring-app.jar"
