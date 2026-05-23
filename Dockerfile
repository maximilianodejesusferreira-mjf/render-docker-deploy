FROM tomcat:7-jre8-alpine

# Limpa a pasta
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia o arquivo
COPY biblivre5.war /usr/local/tomcat/webapps/ROOT.war

# FORÇA a permissão de leitura para o usuário do Tomcat
RUN chmod 644 /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
