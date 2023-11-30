# STUDY DOCKER
Um exercicio simples para estudar o conceito de Docker
Etapas: 

1) Cria um projetinho Java que não faz nada, só imprime 'Eu estou executando de dentro do Docker!'
2) Apesar de ele não ter dependência nenhuma, usa Maven como gerenciamento de dependência. 
3) Usar linha de comando para transformar o projeto em um arquivo ".jar"
4) Executar ele na linha de comando.
5) Construir a imagem docker, usando o Dockerfile
6) O nome da imagem(tag) tem que ser meu-app-java:1
7) Colocar ela para rodar no docker(usando o comando docker run)
8) Ver a mensagem printada no log do docker
9) Instalar o localstack na maquina
______________________________________
## Crie um arquivo .jar
Criando um projetinho java que imprime 'Eu estou executando de dentro do Docker!'
![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/289ff5be-8f29-4b5d-baee-3cbcaaf24da4)
_________
Usar os comandos :
- mvn compile 
- mvn package

No pom.xml tem que ter :
</properties>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <version>3.1.0</version>
                <configuration>
                    <archive>
                        <manifest>
                            <addClasspath>true</addClasspath>
                            <mainClass>org.example.Docker</mainClass> //(entre o <mainClass> ira colocar o nome da package . o nome da classe)
                        </manifest>
                    </archive>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>

Após usar os comandos , irá gerar o arquivo jar no target

![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/a9bcbefb-ce59-4881-8e98-187d26ff93c5)

Execute o Jar com o seguinte comando:
java -jar target/MeuProjetoJava-1.0-SNAPSHOT.jar ,
Isso deve imprimir a mensagem "Eu estou executando de dentro do Docker!" no console. 

![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/c61d7377-a535-4ac4-a312-e82201ef97c0)

____________________
## Crie um Dockerfile
Após gerar o arquivo .jar , criar um arquivo chamado Dockerfile (sem extensão) e adicionar o seguinte conteúdo 
```bash
# Use a imagem oficial do OpenJDK 11 como base
FROM openjdk:11

# Copie o JAR do seu aplicativo para o contêiner
COPY target/seu-aplicativo.jar /app.jar

# Exponha a porta que o aplicativo usa (se necessário)
EXPOSE 8080

# Comando a ser executado ao iniciar o contêiner
CMD ["java", "-jar", "/app.jar"]
```
_______________________________________
## Construa a imagem Docker 
Abra o terminal no diretório onde o seu Dockerfile está localizado e execute o seguinte comando:
```bash
 docker build -t meu-app-java:1 .
```
- docker build: Inicia o processo de construção de uma imagem Docker.
- -t meu-app-java:1: O parâmetro -t é usado para fornecer uma tag à imagem que está sendo construída. Neste caso, a tag é meu-app-java:1. As tags são usadas para identificar versões ou variantes específicas de uma imagem. No exemplo, 1 indica a versão 1 da sua aplicação.
- ". " : Este é o contexto do build. O ponto (.) indica o diretório atual. O Docker procura pelo Dockerfile no diretório fornecido como contexto. Neste caso, o Dockerfile está no diretório atual.

__________________________________________
## Execute a imagem Docker
```bash
docker run -p 8080:8080 meu-app-java:1
```
![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/4d978f07-ed0a-4490-bac9-dcec245a2c1b)

________________________________
## Verifique o log do Docker
Abra outro terminal e execute o seguinte comando para verificar os logs do contêiner:
```bash
docker ps -a
```
Encontre o ID do contêiner que está em execução e, em seguida, execute:
```bash
docker logs <ID_do_Contêiner>
```
Substitua <ID_do_Contêiner> pelo ID real do seu contêiner. Isso mostrará a saída do log do aplicativo Java em execução no contêiner.
'![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/fc9c40aa-e24e-4a2f-8a38-df09b888eca8)
_________________________________________________________________________________________________________
## Localstack na maquina 
Criei um arquivo docker-compose.yaml com as seguintes propriedades

version: "3.8"
```bash
services:
  localstack:
    container_name: "${LOCALSTACK_DOCKER_NAME-localstack-main}"
    image: localstack/localstack
    ports:
      - "127.0.0.1:4566:4566"            # LocalStack Gateway
      - "127.0.0.1:4510-4559:4510-4559"  # external services port range
    environment:
      - DEBUG=${DEBUG-}
      - DOCKER_HOST=unix:///var/run/docker.sock
    volumes:
      - "${LOCALSTACK_VOLUME_DIR:-./volume}:/var/lib/localstack"
      - "/var/run/docker.sock:/var/run/docker.sock"
```
No prompt de comando digite : 
```bash
docker-compose up
```
e ai já está a localstack na maquina 
![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/16104cc1-5742-444f-86e0-f96f43b7aa8d)
![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/0f9d8625-b2bf-486b-b0f3-d0f296666ee9)

