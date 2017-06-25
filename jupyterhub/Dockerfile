
FROM jupyterhub/jupyterhub

EXPOSE 8000

RUN \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils sudo zip unzip vim && \

    # install matplotlib, numpy, pandas and notebook extensions
    conda install -y notebook matplotlib pandas && \
    conda install -y -c conda-forge jupyter_contrib_nbextensions && \

    # install ansible and bash kernel
    pip install ansible bash_kernel && \

    # install pandoc, asciidoc, xvfb and wkhtmltopdf
    #conda install -y pandoc && \
    #apt-get install -y asciidoc asciidoctor xvfb wkhtmltopdf && \

    # install ijavascript and itypescript
    apt-get install -y nodejs-legacy npm && \
    npm install -g ijavascript itypescript && \
    ijsinstall --install=global && \
    its --ts-install=global && \

    # install iruby
    apt-get install -y libtool libffi-dev ruby ruby-dev autoconf pkg-config libzmq-dev && \
    gem install cztop && \
    wget -qO /tmp/master.zip https://github.com/zeromq/czmq/archive/master.zip && \
    unzip /tmp/master.zip -d /tmp/ && \
    cd /tmp/czmq-master && \
    ./autogen.sh && ./configure && make && make install && \
    gem install iruby && \
    iruby register --force && \
    mkdir -p /etc/skel/.local/share && \
    cp -r /root/.ipython /etc/skel/.local/share/jupyter && \

    # install ZeroMQ
    cd /tmp && \
    git clone https://github.com/zeromq/libzmq && \
    cd libzmq && \
    ./autogen.sh && ./configure && make -j 4 && \
    make check && make install && sudo ldconfig && \

    # install gopherlab
    ( \
        echo 'export GOPATH="/opt/go"' \
        echo 'export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"' \
    ) >>/etc/profile.d/golang.sh && \
    . /etc/profile.d/golang.sh && \
    ln -s /usr/local/go/bin/go /bin/ && \
    mkdir -p /opt/go && \
    chmod -R g+ws /opt/go && \
    echo 'umask 002' >>/etc/profile && \
    wget -qO- https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar zxf - -C /usr/local && \
    go get github.com/fabian-z/gopherlab && \
    mkdir -p /etc/skel/.local/share/jupyter/kernels/gopherlab && \
    sed -i 's!/go!/opt/go!' /opt/go/src/github.com/fabian-z/gopherlab/kernel/kernel.json && \
    cp /opt/go/src/github.com/fabian-z/gopherlab/kernel/* /etc/skel/.local/share/jupyter/kernels/gopherlab/ && \

    # install OpenJDK8 and kotlin-jupyter
    echo 'deb http://http.debian.net/debian jessie-backports main' >>/etc/apt/sources.list && \
    apt-get update -y && \
    apt-get upgrade -y && \
    ( \
        echo 'export JAVA_HOME="/usr/lib/jvm/openjdk-8-openjdk-amd64"' \
        echo 'export PATH="$PATH:$JAVA_HOME/bin"' \
    ) >>/etc/profile.d/openjdk.sh && \
    apt-get install -y -t jessie-backports openjdk-8-jdk && \
    cd /tmp && \
    git clone https://github.com/ligee/kotlin-jupyter && \
    cd kotlin && \
    mkdir -p /opt/kotlin-jupyter && \
    ./gradlew install -PinstallPath=/opt/kotlin-jupyter && \
    cp -r /root/.ipython/kernels/kotlin /etc/skel/.local/share/jupyter/kernels/ && \

    # create skel and admin user(passwd: 'admin') can sudo
    useradd -G root -m -s /bin/bash admin && \
    ( echo 'admin'; echo 'admin' ) | passwd admin && \

    # sudo configuration
    ( \
        echo '%root ALL=(ALL) NOPASSWD: ALL' \
        echo 'Defaults:%root !requiretty' \
    ) >>/etc/sudoers.d/root && \
    chmod 440 /etc/sudoers.d/root && \

    # clean cache
    cd && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/list/* && \
    rm -rf /tmp/*


ENTRYPOINT ["/opt/conda/bin/jupyterhub"]
CMD ["--no-ssl"]
