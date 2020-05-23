FROM maven:3-jdk-8 as mvn
RUN git clone https://github.com/wakaleo/game-of-life.git
RUN cd game-of-life/ && mvn package

FROM tomcat:8
LABEL AUTHOR="khaja"
COPY --from=mvn /game-of-life/gameoflife-web/target/gameoflife*.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
