FROM tomcat:7-jre8-alpine

# Limpa os aplicativos padrão do Tomcat para liberar memória
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Baixa o Driver do PostgreSQL direto para a pasta de bibliotecas (lib) do Tomcat
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# 2. Baixa o instalador estável do Biblivre 5 renomeando para ROOT.war (sistema principal)
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://central.biblivre.org.br/download/biblivre5.war

EXPOSE 8080
