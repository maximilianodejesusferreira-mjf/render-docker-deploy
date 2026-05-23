FROM tomcat:7-jre8-alpine

# Limpa os aplicativos padrão do Tomcat para liberar memória
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Baixa o Driver do PostgreSQL direto para a pasta de bibliotecas (lib) do Tomcat
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# 2. Baixa o arquivo do Biblivre 5 renomeando para ROOT.war (sistema principal)
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://github.com/cleydyr/biblivre5-docker/raw/master/tomcat/biblivre5.war

EXPOSE 8080
