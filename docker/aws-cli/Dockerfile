FROM alpine:3.4
MAINTAINER Mriyam Tamuli <mbtamuli@gmail.com>

RUN apk --update add \
      bash \
      curl \
      git \
      groff \
      less \
      python \
      py-pip \
      zsh

WORKDIR /root

RUN pip install --upgrade awscli awsebcli && mkdir /root/.aws
RUN echo -e "complete -C '/usr/bin/aws_completer' aws\nPS1=\"[\u@awscli \W]\\$ \"\nTERM=screen-256color" >> /root/.bashrc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true
RUN echo -e "source /usr/bin/aws_zsh_completer.sh" >> /root/.zshrc

ENTRYPOINT  [ "/bin/sh", "-c" ]
CMD         [ "aws", "--version" ]
