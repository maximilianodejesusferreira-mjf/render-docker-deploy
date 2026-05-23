FROM tomcat:7-jre8-alpine

# Remove o que vem por padrão
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia o arquivo que está aí dentro do seu GitHub
COPY biblivre5.war /usr/local/tomcat/webapps/ROOT.war

# Abre a porta
EXPOSE 8080
