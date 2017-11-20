FROM openjdk:8u121-jdk-alpine

WORKDIR $USER_HOME_DIR

COPY src
COPY pom.xml

CMD ["mvn", "sonar:sonar"]
