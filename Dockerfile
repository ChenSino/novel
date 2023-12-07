FROM openjdk:17-jdk-slim

ENV TZ=Asia/Shanghai
ENV JAVA_OPTS="-Xms512m -Xmx1024m -Djava.security.egd=file:/dev/./urandom"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /novel

WORKDIR /novel

EXPOSE 8888

ADD ./target/novel-3.4.0.jar ./

CMD sleep 60; java $JAVA_OPTS -jar novel-3.4.0.jar
