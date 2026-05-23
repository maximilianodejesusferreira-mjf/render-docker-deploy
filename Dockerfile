FROM tomcat:7-jre8-alpine

# Limpa a pasta padrão do Tomcat para liberar memória
RUN rm -rf /usr/local/tomcat/webapps/*

# Instala o utilitário curl dentro do contêiner
RUN apk add --no-cache curl

# 1. Baixa o Driver do PostgreSQL direto para as bibliotecas do Tomcat
RUN wget -O /usr/local/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# 2. Copia o script que criamos e manda a própria Render baixar o Biblivre direto da fonte de lançamentos estável
COPY baixar.sh .
RUN chmod +x baixar.sh && ./baixar.sh

# 3. Move o arquivo baixado para o lugar definitivo
RUN mv biblivre5.war /usr/local/tomcat/webapps/ROOT.war && rm baixar.sh

EXPOSE 8080
