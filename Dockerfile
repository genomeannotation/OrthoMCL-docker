FROM centos

# Install some utilities
RUN yum install -y wget tar

# Make a software folder
RUN mkdir software
RUN cd software

# Install blast
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN tar -xzvf ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN rm ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN export PATH=$PATH:/software/ncbi-blast-2.2.30+/bin
