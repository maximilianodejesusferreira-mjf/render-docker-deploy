FROM tomcat:7-jre8-alpine

# Limpa os aplicativos padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Baixa o Driver do PostgreSQL direto para a pasta de bibliotecas (lib) do Tomcat
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# 2. Baixa o Biblivre 5 usando o link direto estável do próprio repositório que clonamos
ADD https://raw.githubusercontent.com/cleydyr/biblivre5-docker/master/tomcat/biblivre5.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
