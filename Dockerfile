# Usa o servidor espelho oficial da Amazon (ECR) para o Tomcat, burlado o bloqueio do Docker Hub
FROM public.ecr.aws/docker/library/tomcat:7-jre8-alpine

# Limpa os aplicativos padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# 1. Baixa o Driver do PostgreSQL para a pasta de bibliotecas do Tomcat
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# 2. Baixa o Biblivre 5 usando o gateway alternativo direto
ADD https://github.com/cleydyr/biblivre5-docker/raw/0cc68a52932c57f9cbcae682d33b5c6b659a8c48/tomcat/biblivre5.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
