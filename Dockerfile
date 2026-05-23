FROM tomcat:7-jre8-alpine

# Remove os aplicativos padrão do Tomcat para economizar memória e evitar conflitos
RUN rm -rf /usr/local/tomcat/webapps/*

# Baixa o arquivo oficial do Biblivre 5 direto para a pasta correta do Tomcat
ADD https://github.com/cleydyr/biblivre5-docker/raw/0cc68a52932c57f9cbcae682d33b5c6b659a8c48/tomcat/biblivre5.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
