FROM amazonlinux:2

RUN yum install -y gcc openssl-devel bzip2-devel libffi-devel curl tar gzip make zip && \
        yum clean all && \
        rm -rf /var/cache/yum
ARG PYTHON_VERSION
RUN curl https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz | tar zxf -
RUN cd Python-${PYTHON_VERSION} && ./configure --enable-optimizations && \
        make altinstall && \
        cd - \
        rm -rf Python-${PYTHON_VERSION}
RUN python$(echo $PYTHON_VERSION | sed 's/\([0-9]*\)\.\([0-9]*\).*/\1.\2/') -m pip install -U pip
