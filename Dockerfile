FROM openjdk:17 as base 
WORKDIR /app
COPY . .
RUN chmod +x gradlew
RUN ./gradlew build


FROM tomcat:9.0
WORKDIR webapps
COPY --from=base /app/build/libs/sampleWeb-0.0.1-SNAPSHOT.war .
RUN rm -fr ROOT && mv sampleWeb-0.0.1-SNAPSHOT.war ROOT.war



