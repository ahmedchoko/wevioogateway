FROM openjdk:11
EXPOSE 8236
ADD /target/wevioopfe-0.0.1-SNAPSHOT.jar wevioopfe.jar
ENTRYPOINT ["java","-jar","/wevioopfe.jar"]