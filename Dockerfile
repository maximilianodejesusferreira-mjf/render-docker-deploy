FROM tomcat:7-jre8-alpine

# Limpa a pasta padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia o arquivo que você subiu no GitHub
COPY biblivre5.war /usr/local/tomcat/webapps/ROOT.war

# Instala o driver do PostgreSQL necessário para o sistema funcionar
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

EXPOSE 8080
