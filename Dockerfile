FROM maven:3-openjdk-17 AS mbuilder
RUN mkdir /hello
RUN git clone https://github.com/KIMJINW00/source-maven-java-spring-hello-webapp /hello
WORKDIR /hello
RUN mvn package

FROM tomcat:9-jre17
COPY --from=mbuilder /hello/target/hello-world.war /usr/local/tomcat/webapps/

