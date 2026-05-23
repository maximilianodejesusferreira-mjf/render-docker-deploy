# Usa uma imagem oficial do ecossistema corporativo (Red Hat/CentOS) livre de bloqueios de rate limit
FROM quay.io/centos/centos:stream9

# Instala o Java e utilitários necessários de forma nativa
RUN dnf install -y java-1.8.0-openjdk wget && dnf clean all

# Cria as pastas do servidor manual para não depender de imagens prontas travadas
WORKDIR /opt

# Baixa uma versão estável e limpa do Tomcat de um espelho público alternativo
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.109/bin/apache-tomcat-7.0.109.tar.gz && \
    tar -xf apache-tomcat-7.0.109.tar.gz && \
    mv apache-tomcat-7.0.109 tomcat && \
    rm -f apache-tomcat-7.0.109.tar.gz

# Limpa os apps padrões para economizar a memória do plano gratuito da Render
RUN rm -rf /opt/tomcat/webapps/*

# 1. Baixa o Driver do PostgreSQL para a pasta de bibliotecas do Tomcat instalado
RUN wget -O /opt/tomcat/lib/postgresql-42.2.24.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar

# 2. Injeta o arquivo estável do Biblivre 5 renomeando para ROOT.war
ADD https://github.com/cleydyr/biblivre5-docker/raw/0cc68a52932c57f9cbcae682d33b5c6b659a8c48/tomcat/biblivre5.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080

# Comando para iniciar o Tomcat manualmente em primeiro plano
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
