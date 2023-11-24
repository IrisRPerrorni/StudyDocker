# Use a imagem oficial do OpenJDK 11 como base
FROM openjdk:11

# Copie o JAR do seu aplicativo para o contêiner
COPY target/Docker-1.0-SNAPSHOT.jar /app.jar

# Exponha a porta que o aplicativo usa (se necessário)
EXPOSE 8080

# Comando a ser executado ao iniciar o contêiner
CMD ["java", "-jar", "/app.jar"]
