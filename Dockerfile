FROM ubuntu
RUN apt-get update -y
RUN apt-get install wget -y
RUN wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb
RUN apt-get -qqy install ./jdk-19_linux-x64_bin.deb -y
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-19/bin/java 1919
COPY build/libs/calculator-0.0.1-SNAPSHOT.jar app.ja
ENTRYPOINT ["java", "-jar", "app.jar"]