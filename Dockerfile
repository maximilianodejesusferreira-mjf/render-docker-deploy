FROM tomcat:7-jre8-alpine
# Remove a página padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
# Copia seu arquivo para a raiz do Tomcat, fazendo com que ele responda em "/"
COPY biblivre5.war /usr/local/tomcat/webapps/ROOT.war
# Expõe a porta que a Render usa
EXPOSE 8080
