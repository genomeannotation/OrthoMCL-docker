FROM centos

# Install some utilities
RUN yum install -y wget tar perl perl-DBI gcc make

# Make a software folder
RUN mkdir /software

# Install blast
RUN cd /software
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN tar -xzvf ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN rm ncbi-blast-2.2.30+-x64-linux.tar.gz
RUN export PATH=$PATH:/software/ncbi-blast-2.2.30+/bin

# Install MCL
RUN cd /software
RUN wget http://micans.org/mcl/src/mcl-14-137.tar.gz
RUN tar -xzvf mcl-14-137.tar.gz
RUN rm mcl-14-137.tar.gz
RUN cd /software/mcl-14-137
RUN ./configure --enable-blast --prefix=/software/mcl
RUN make install
RUN cd /software
RUN rm -rf /software/mcl-14-137
RUN export PATH=$PATH:/software/mcl/bin

# Install OrthoMCL
RUN cd /software
RUN wget http://www.orthomcl.org/common/downloads/software/v2.0/orthomclSoftware-v2.0.9.tar.gz
RUN tar -xzvf orthomclSoftware-v2.0.9.tar.gz
RUN rm orthomclSoftware-v2.0.9.tar.gz
RUN export PATH=$PATH:/software/orthomclSoftware-v2.0.9/bin
