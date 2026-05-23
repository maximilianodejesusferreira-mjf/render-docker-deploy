FROM tomcat:7-jre8-alpine

# Remove o conteúdo padrão
RUN rm -rf /usr/local/tomcat/webapps/*

# Baixa a versão oficial diretamente da fonte (é a forma mais garantida de ter um arquivo válido)
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://repo1.maven.org/maven2/org/biblivre/biblivre/5.0.4/biblivre-5.0.4.war

# Remove a configuração AJP problemática
RUN sed -i '/Connector port="8009"/d' /usr/local/tomcat/conf/server.xml

EXPOSE 8080
