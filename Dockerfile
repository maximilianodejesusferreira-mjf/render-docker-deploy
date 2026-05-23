FROM tomcat:7-jre8-alpine

# Limpa absolutamente tudo da pasta webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Instala o utilitário curl e unzip
RUN apk add --no-cache curl unzip

# 1. Baixa o Driver do PostgreSQL direto para as bibliotecas do Tomcat
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# 2. Cria a pasta ROOT, baixa o Biblivre e descompacta ele direto lá dentro
RUN mkdir -p /usr/local/tomcat/webapps/ROOT && \
    curl -L -o /tmp/biblivre5.war https://github.com/cleydyr/biblivre5-docker/releases/download/v5.0.4/biblivre5.war && \
    unzip /tmp/biblivre5.war -d /usr/local/tomcat/webapps/ROOT/ && \
    rm -f /tmp/biblivre5.war

EXPOSE 8080
