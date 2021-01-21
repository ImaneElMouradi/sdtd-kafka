FROM centos:latest

RUN yum -y update;
RUN yum -y clean all;

#SET UP THE ENVIRONNEMENT
RUN yum install -y  wget dialog curl sudo lsof vim telnet nano openssh-server openssh-clients bzip2 passwd tar bc git unzip
#INSTALL JAVA 1.8
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel 

#CREATE USER
RUN useradd guest -u 1000
RUN echo guest | passwd guest --stdin


#INSTALL PYTHON 2.7 
RUN yum install -y python27



ENV HOME /home/guest
WORKDIR $HOME

#INSTALL KAFKA
RUN wget https://mirror.ibcp.fr/pub/apache/kafka/2.6.0/kafka_2.12-2.6.0.tgz
RUN tar xvzf kafka_2.12-2.6.0.tgz
RUN mv kafka_2.12-2.6.0 kafka
RUN rm kafka_2.12-2.6.0.tgz
RUN chmod -R 777 $HOME/kafka


COPY server.properties /home/guest/kafka/config/server.properties

# SET ENVIRONNEMENT ALIASES 
ADD setenv.sh /home/guest/setenv.sh
RUN chown guest:guest setenv.sh
RUN echo . ./setenv.sh >> .bashrc
# SET ENVIRONNEMENT VARIABLES
ENV PATH $HOME/kafka/bin:$PATH


# ADD THE START UP SCRIPT 
ADD startup_script.sh /usr/local/bin/startup_script.sh
RUN chmod +x /usr/local/bin/startup_script.sh



EXPOSE 9092
# RUN THE STARTUP SCRIPT
CMD [ "startup_script.sh" ]

