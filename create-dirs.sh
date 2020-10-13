#!/bin/bash

mkdir -p ~/docker/mule-ee/apps
mkdir -p ./containers/jenkins/data
mkdir -p ./containers/nexus/data
mkdir -p ./containers/sonarqube/data
mkdir -p ./containers/postgresql/data
chmod a+w ./containers/jenkins/data
chmod a+w ./containers/nexus/data
chmod a+w ./containers/sonarqube/data
chmod a+w ./containers/postgresql/data