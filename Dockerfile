# DOCKER-VERSION 0.10.0
FROM      centos:centos6

# set work directory
WORKDIR   /home/apps

# update yum
RUN       yum update

# install npm
RUN       rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# install node
RUN       yum install -y npm
RUN       yum install -y git

# get app code
RUN git clone https://github.com/matheuspbg/docker-test.git

# go to app directory and install dependencies
RUN cd /docker-test; npm install

# install packages
RUN npm install

# set port 8080
EXPOSE  8080

# start application
CMD ["node", "index.js"]