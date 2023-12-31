#!/bin/bash
#borrowed from mccarrmb/docker-doom on Github
zandronum-server \
  -host \
  -port 10666 \
  -iwad "/home/zandronum/iwad/$IWAD" \
  +exec "/home/zandronum/config/$CONFIG" \
  +CrashLog_Dir "/home/zandronum/logs/$SERVER_NAME.log" \
  +CrashLogs 2 \
  +map "$START_MAP"