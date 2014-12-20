FROM centos

# Install some utilities
RUN yum install -y wget tar perl perl-DBI

# Make a software folder
RUN mkdir software
RUN cd software

# Install blast
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN tar -xzvf ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN rm ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN export PATH=$PATH:/software/ncbi-blast-2.2.30+/bin

# Install OrthoMCL
RUN wget http://www.orthomcl.org/common/downloads/software/v2.0/orthomclSoftware-v2.0.9.tar.gz
RUN tar -xzvf orthomclSoftware-v2.0.9.tar.gz
RUN rm orthomclSoftware-v2.0.9.tar.gz
RUN export PATH=$PATH:/software/orthomclSoftware-v2.0.9/bin
