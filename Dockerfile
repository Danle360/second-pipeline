FROM tomcat:8.0.21-jre8
#RUN sed -i '/<\/tomcat-users>/ i\<user username="admin" password="password" roles="admin-gui,manager-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY target/mss-maven-web-app.war /usr/local/tomcat/webapps/mss-maven-web-app.war

#docker build -t java-web-app:1 .
#docker run -d -p 8080:8080 --name jemo java-web-app:1