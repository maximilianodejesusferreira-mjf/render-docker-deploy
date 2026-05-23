FROM tomcat:7-jre8-alpine

# Removemos qualquer coisa prévia para garantir um ambiente limpo
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos o seu arquivo para a pasta webapps
COPY biblivre5.war /usr/local/tomcat/webapps/biblivre.war

# Adicionamos o driver do Postgres, essencial para o Biblivre se conectar ao banco
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

EXPOSE 8080
