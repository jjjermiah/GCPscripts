#!/bin/bash
# Adds R to apt and install it
#
# Instructions:
# sudo chmod 700 InstallR.sh
# ./FirstTimeInstallR.sh
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9
gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y r-base r-base-dev r-cran-xml r-cran-rjava libcurl4-openssl-dev
sudo apt-get install -y libssl-dev libxml2-dev openjdk-7-* libgdal-dev libproj-dev libgsl-dev
sudo apt-get install -y xml2 default-jre default-jdk mesa-common-dev libglu1-mesa-dev freeglut3-dev 
sudo apt-get install -y mesa-common-dev libx11-dev r-cran-rgl r-cran-rglpk r-cran-rsymphony r-cran-plyr 
sudo apt-get install -y  r-cran-reshape  r-cran-reshape2 r-cran-rmysql
sudo R CMD javareconf