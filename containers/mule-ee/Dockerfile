#
# example Dockerfile for Linux Alpine
#
# includes: Maven 3.6.3, Open JDK 8, Scala (default), Mule Runtime EE.
# tools: unzip, wget.
#

FROM alpine:latest
FROM maven:3.6.3-openjdk-8

# get 'apt-get' packages and install Scala
RUN apt-get update -y \
	&& apt-get install -y unzip \
	&& apt-get install -y wget \
	&& apt-get install -y scala

#RUN mkdir mulezip && cd mulezip

# Download Mule Runtime EE
RUN wget http://s3.amazonaws.com/new-mule-artifacts/mule-ee-distribution-standalone-4.3.0.zip

# Define environment variables
#ENV BUILD_DATE=10062020
#ENV MULE_HOME=/opt/mule
#ENV MULE_VERSION=4.3.0

RUN unzip mule-ee-distribution-standalone-4.3.0.zip
RUN ln -s $(pwd)/mule-enterprise-standalone-4.3.0 ${MULE_HOME}

RUN chmod 777 $MULE_HOME/bin/mule
RUN chmod 777 $MULE_HOME/bin/launcher

RUN ln -s ${MULE_HOME}/apps /apps

CMD ["/opt/mule/bin/mule"]
