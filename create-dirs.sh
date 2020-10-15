#!/bin/bash

mkdir -p ./containers/mule-ee/data/apps
mkdir -p ./containers/jenkins/data
mkdir -p ./containers/nexus/data
mkdir -p ./containers/sonarqube/data
mkdir -p ./containers/postgresql/data


chmod -R a+w ./containers/mule-ee/data
chmod -R a+w ./containers/jenkins/data
chmod -R a+w ./containers/nexus/data
chmod -R a+w ./containers/sonarqube/data
chmod -R a+w ./containers/postgresql/data