FROM tomcat:7-jre8-alpine

# Limpa a pasta webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Instala o driver do PostgreSQL
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# Baixa o Biblivre 5 do repositório estável da Maven Central (onde ele realmente vive)
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://repo1.maven.org/maven2/org/biblivre/biblivre/5.0.4/biblivre-5.0.4.war

EXPOSE 8080
