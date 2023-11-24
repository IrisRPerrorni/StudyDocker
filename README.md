# StudyDocker
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
______________________________________
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

![image](https://github.com/IrisRPerrorni/StudyDocker/assets/133882090/c61d7377-a535-4ac4-a312-e82201ef97c0)


