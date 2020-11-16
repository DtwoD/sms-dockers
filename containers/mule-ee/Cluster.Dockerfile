FROM alpine:latest
FROM maven:3.6.3-openjdk-8

ARG MULE_HOME
ARG MULE_VERSION
ARG MULE_SERVER_OWNER
ARG MULE_SERVER_ID

# get 'apt-get' packages and install Scala
RUN apt-get update -y \
	&& apt-get install -y unzip \
	&& apt-get install -y wget \
	&& apt-get install -y scala

# Download Mule Runtime EE
RUN wget http://s3.amazonaws.com/new-mule-artifacts/mule-ee-distribution-standalone-${MULE_VERSION}.zip
RUN unzip mule-ee-distribution-standalone-${MULE_VERSION}.zip
RUN ln -s $(pwd)/mule-enterprise-standalone-${MULE_VERSION} ${MULE_HOME}

RUN chmod 777 $MULE_HOME/bin/mule
RUN chmod 777 $MULE_HOME/bin/launcher

#CMD ["/opt/mule/bin/mule"]
