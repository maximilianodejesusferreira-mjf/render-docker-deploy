FROM tomcat:7-jre8-alpine

# Limpa a pasta webapps e garante que o driver do Postgres esteja lá
RUN rm -rf /usr/local/tomcat/webapps/* && \
    wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# Baixa o Biblivre 5 direto para a pasta correta (Tomcat vai descompactar sozinho)
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://github.com/cleydyr/biblivre5-docker/releases/download/v5.0.4/biblivre5.war

EXPOSE 8080
