FROM apline 3.14

RUN echo 'installing base packages...' && apk update && apk add --no-cache \
  bash \
  bash-completion \
  curl \
  openssh \
  openssl \
  py3-pip \
  python3 \
  ruby \
  tar \
  wget

RUN echo 'installing glibc...' && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
  wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk && \
  apk add glibc-2.33-r0.apk

RUN echo 'installing go...' && wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

RUN echo 'installing packages needed to compile extensions...' && apk add --no-cache \
  gcc \
  libiffi-dev \
  make \
  musl-dev \
  python3-dev \
  openssl-dev \
  cargo

RUN echo 'installing azure cli...' && pip3 install \
  azure.cli

COPY bash/.bash_profile bash/.bashrc /root/

RUN echo 'installing git...' && apk add --no-cache \
  git
COPY git/.gitconfig git/.gitignore /root/
RUN wget -O /root/.git-prompt.sh https://raw.githubcontent.com/git/git/master/contrib/completion/git-prompt.sh

RUN echo 'installing vim...' && apk add --no-cache \
  vim
COPY vim/.vimrc /root/.vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall &>/dev/null && \
  echo "\" Solarized color scheme" >> /root/.vimrc && \
  echo "set background=dark" >> /root/.vimrc && \
  echo "colorscheme solarized" >> /root/.vimrc
COPY vim/.spell /root/.vim/spell/en.utf-8.add

RUN echo 'installing tmux...' && apk add --no-cache \
  tmux
COPY tmux/.tmux.conf /root/.tmux.conf

RUN 'installing tmuxinator...' && gem install tmuxinator && \
  mkdir /root/.tmuxinator
COPY tmuxinator/default.yml /root/.tmuxinator/default.yml
ENV EDITOR=vim SHELL=/bin/bash

ENV TF_VERSION=0.13.7
RUN echo 'installing terraform...' && curl -o /terraform_${TF_VERSION}_linux_amd64.zip -kslO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip && \
  unzip -o /terraform_${TF_VERSION}_linux_amd64.zip terraform && \
  ln -s /terraform /usr/local/bin/terraform

RUN echo 'installing tools...' && apk add --no-cache \
  bind-tools \
  jq \
  tig \ 
  util-linux \
  less && \
  curl https://beyondgrep.com/ack-v3.5.0 > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack && \
  az extension add --name resource-graph && \  
  az extension add --name account

CMD /bin/bash
