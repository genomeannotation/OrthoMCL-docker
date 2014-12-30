FROM centos

# Install some utilities
RUN yum install -y wget tar perl perl-DBI perl-DBD-MySQL gcc make

# Make a software folder
RUN mkdir /software

# Install blast
RUN cd /software \
    && wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.30+-x64-linux.tar.gz \
    && tar -xzvf ncbi-blast-2.2.30+-x64-linux.tar.gz \
    && rm ncbi-blast-2.2.30+-x64-linux.tar.gz

# Install MCL
RUN cd /software \
    && wget http://micans.org/mcl/src/mcl-14-137.tar.gz \
    && tar -xzvf mcl-14-137.tar.gz \
    && rm mcl-14-137.tar.gz \
    && cd /software/mcl-14-137 \
    && ./configure --enable-blast --prefix=/software/mcl \
    && make install \
    && cd /software \
    && rm -rf /software/mcl-14-137

# Install OrthoMCL
RUN cd /software \
    && wget http://www.orthomcl.org/common/downloads/software/v2.0/orthomclSoftware-v2.0.9.tar.gz \
    && tar -xzvf orthomclSoftware-v2.0.9.tar.gz \
    && rm orthomclSoftware-v2.0.9.tar.gz

# Setup the paths
ENV PATH $PATH:/software/ncbi-blast-2.2.30+/bin
ENV PATH $PATH:/software/mcl/bin
ENV PATH $PATH:/software/orthomclSoftware-v2.0.9/bin
