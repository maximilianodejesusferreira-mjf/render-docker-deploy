FROM tomcat:7-jre8-alpine

# Limpa a pasta webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Instala o driver do PostgreSQL
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# Baixa o Biblivre 5 de um espelho público estável (SourceForge/Maven Mirror)
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://sourceforge.net/projects/biblivre5/files/biblivre5.war/download

EXPOSE 8080
