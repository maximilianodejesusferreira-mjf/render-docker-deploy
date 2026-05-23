# Usa uma imagem base leve com Java instalado
FROM eclipse-temurin:8-jre-alpine

# Copia o seu arquivo para a pasta de trabalho
COPY biblivre5.war /app/biblivre.war

# Define a pasta de trabalho
WORKDIR /app

# Comando que força o Java a rodar o arquivo como uma aplicação standalone
CMD ["java", "-jar", "biblivre.war"]
