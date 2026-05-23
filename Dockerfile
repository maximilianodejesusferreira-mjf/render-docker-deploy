FROM tomcat:7-jre8

# Baixa o instalador do Biblivre 5 oficial e coloca na pasta do Tomcat
ADD https://github.com/cleydyr/biblivre5-docker/raw/master/tomcat/biblivre5.war /usr/local/tomcat/webapps/

EXPOSE 8080
