FROM mysql:latest
MAINTAINER Josue Orozco <josueorozco@outlook.com>

##
# Add custom configurations
ADD ./conf.d /etc/mysql/conf.d

##
# Add scripts to execute at startup
ADD ./scripts /docker-entrypoint-initdb.d

##
# Add sshdmp
ADD ./sshdmp /sshdmp
