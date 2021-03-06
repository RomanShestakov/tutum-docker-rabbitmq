FROM ubuntu:quantal
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install RabbitMQ
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server pwgen
RUN rabbitmq-plugins enable rabbitmq_management

# Add scripts
ADD run.sh /run.sh
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh
RUN chmod 755 ./*.sh

EXPOSE 5672 55672
CMD ["/run.sh"]
