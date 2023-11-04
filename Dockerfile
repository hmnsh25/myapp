FROM centos

#Update appstream
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*


RUN yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y

# Install Python
RUN curl https://www.python.org/ftp/python/3.10.13/Python-3.10.13.tgz --output /tmp/Python-3.10.13.tgz
WORKDIR /tmp
RUN tar xzf Python-3.10.13.tgz
WORKDIR /tmp/Python-3.10.13
RUN ./configure --enable-optimizations
RUN yum install make -y && \
    make altinstall && \
    yum install which -y
WORKDIR /tmp
RUN rm -r Python-3.10.13.tgz

# Install Pip
RUN yum -y install epel-release
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN python3.10 get-pip.py
RUN python3.10 -m pip install --upgrade pip
#RUN echo "streamlit" > requirements.txt
COPY . .

RUN pip install streamlit
ENTRYPOINT ["python3.10", "my-web-page.py"]

