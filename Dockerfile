FROM tomcat:7-jre8-alpine

# Limpa a pasta
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia o arquivo
COPY biblivre5.war /usr/local/tomcat/webapps/ROOT.war

# Remove a configuração AJP que está causando o erro de "Invalid message"
RUN sed -i '/Connector port="8009"/d' /usr/local/tomcat/conf/server.xml

EXPOSE 8080
