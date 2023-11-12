# Cause fuck Ubuntu
FROM debian:bookworm-slim

# Update the OS
RUN apt-get update --yes
RUN apt-get upgrade --yes

# Helper libraries for adding repo
RUN apt-get install -yes dialog apt-utils software-properties-common wget

# Adding Zandronum repo and installing the application

RUN wget -O - http://debian.drdteam.org/drdteam.gpg | apt-key add -
RUN apt-add-repository 'deb https://debian.drdteam.org stable multiverse'
RUN apt-get update --yes
RUN apt-get upgrade --yes
RUN apt-get install --yes --quiet libsdl-image1.2 zandronum

# Create a non-privileged user
RUN useradd -ms /bin/bash zandronum

# Build the app directory and add files
RUN mkdir /home/zandronum/config && \
    mkdir /home/zandronum/wad/ && \
    mkdir /home/zandronum/iwad/ && \
    mkdir /home/zandronum/bin/ && \
    mkdir /home/zandronum/player/ && \
    mkdir /home/zandronum/logs/

COPY /config/ /home/zandronum/config/
COPY /bin/ /home/zandronum/bin/
COPY /player/ /home/zandronum/player/
COPY /iwad/ /home/zandronum/iwad/
COPY /wad/ /home/zandronum/wad/

# RUN wget -O /home/zandronum/config/masterbanlist.txt https://zandronum.com/banlist && \
#     cat masterbanlist.txt >> /home/zandronum/player/banlist.txt
# Zandronum has a config 'sv_enforcemasterlist'
# so this isnt needed unless you want a local static copy

USER root
RUN chown -R zandronum:zandronum /home/zandronum
USER zandronum
WORKDIR /home/zandronum
RUN chmod +x /home/zandronum/bin/start.bash

CMD ["/home/zandronum/bin/start.bash"]
ENTRYPOINT [ "/home/zandronum/bin/start.bash" ]
EXPOSE 10666
