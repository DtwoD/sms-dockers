FROM jenkins/jenkins:lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER root
RUN apt update -y
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

# Drop back to the regular jenkins user
USER jenkins

# Install plugins defined on plugins.txt
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt