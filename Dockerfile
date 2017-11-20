FROM maven:3.5.2-jdk-8

WORKDIR /src

COPY . /src

CMD ["mvn", "sonar:sonar"]
