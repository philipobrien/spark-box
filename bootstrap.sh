#!/usr/bin/env bash
sudo apt-get update -q
sudo apt-get install -y openjdk-7-jdk
sudo apt-get remove -y scala-library scala
sudo apt-get install -y maven
sudo apt-get install -y software-properties-common
sudo apt-get install -y libjansi-java
sudo apt-get update
wget --quiet www.scala-lang.org/files/archive/scala-2.10.3.deb
sudo dpkg -i scala-2.10.3.deb
sudo apt-get install -y scala
sudo rm scala-2.10.3.deb
sudo apt-get install -y git
cd /usr/local && git clone https://github.com/apache/spark.git
cd /usr/local/spark
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"
mvn -DskipTests clean package

echo "alias ..='cd ..'" >> ~/.profile
echo "alias ...='cd ../..'" >> ~/.profile
echo "alias ....='cd ../../..'" >> ~/.profile
echo "export PS1='\[\e[0;36m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[1;35m\] \$\[\e[m\] '" >> ~/.profile