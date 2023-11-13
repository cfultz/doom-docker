# Cause fuck Ubuntu
FROM debian:bookworm-slim

# Default environment variables
ENV DEBIAN_FRONTEND noninteractive 
ENV IWAD doom1.wad
ENV CONFIG default.cfg
ENV SERVER_NAME Docker-Doom
ENV START_MAP E1M1

# Update the OS
RUN apt-get update --yes
RUN apt-get upgrade --yes

# Helper libraries for adding repo
RUN apt-get install --yes dialog apt-utils wget

# Adding Zandronum repo and installing the application

RUN wget -O /etc/apt/trusted.gpg.d/drdteam.gpg https://debian.drdteam.org/drdteam.gpg
RUN echo "deb https://debian.drdteam.org stable multiverse" >> /etc/apt/sources.list
RUN apt-get update --yes
RUN apt-get upgrade --yes
RUN apt-get install --yes --quiet libsdl-image1.2 zandronum

# Create a non-privileged user
RUN useradd -ms /bin/bash server

# Build the app directory and add files
RUN mkdir /home/server/config && \
    mkdir /home/server/wad/ && \
    mkdir /home/server/iwad/ && \
    mkdir /home/server/bin/ && \
    mkdir /home/server/player/ && \
    mkdir /home/server/logs/

COPY /config/ /home/server/config/
COPY /bin/ /home/server/bin/
COPY /player/ /home/server/player/
COPY /iwad/ /home/server/iwad/
COPY /wad/ /home/server/wad/

# RUN wget -O /home/server/config/masterbanlist.txt https://zandronum.com/banlist && \
#     cat masterbanlist.txt >> /home/server/player/banlist.txt
# Zandronum has a config 'sv_enforcemasterlist'
# so this isnt needed unless you want a local static copy

USER root
RUN chown -R server:server /home/server
USER server
WORKDIR /home/server
RUN chmod +x /home/server/bin/start.bash

CMD ["/home/server/bin/start.bash"]
ENTRYPOINT [ "/home/server/bin/start.bash" ]
EXPOSE 10666
