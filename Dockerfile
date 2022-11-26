FROM tomcat:latest
LABEL maintainer="arifarimala"
# Dummy text to test
add ./target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
Expose 8080
CMD ["catalina.sh", "run"]