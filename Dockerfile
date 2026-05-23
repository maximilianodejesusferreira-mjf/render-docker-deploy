FROM tomcat:7-jre8-alpine

# Limpa a pasta padrão do Tomcat para liberar memória
RUN rm -rf /usr/local/tomcat/webapps/*

# Baixa o pacote oficial do Biblivre 5 direto para o servidor
RUN wget  -O /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
