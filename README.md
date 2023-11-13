# doom-docker
Docker image built at SuperComputing 2023 in Denver, CO for a Docker Tutorial Class for utilizing containers for HPC and specific use cases.

## So, you reinvented the wheel?

Well... yeah kinda.

![But why?](https://media.tenor.com/jGgmfDOxmuMAAAAC/ryan-reynolds-but-why.gif)

Because, I love boomer shooters (specifically Doom2, Doom64, and Duke Nukem 3D) and wanted to use an actual use case that I would like to use myself in my tutorial class. As I built this, I realized there was a plethora of other awesome projects with very similar setups, but meh, why not one more?

#### List of Other Projects similar to this one

* [frozenfoxx/docker-zandronum-server](https://github.com/frozenfoxx/docker-zandronum-server)
* [rcdailey/zandronum-server](https://github.com/rcdailey/zandronum-server)
* [mccarrmb/docker-doom](https://github.com/mccarrmb/docker-doom)

## What's different about yours?

This container is built on Debian Bookworm Slim instead of the spyware known as Ubuntu. Even though they abandoned the idea years ago, (people don't forget)[https://www.eff.org/deeplinks/2012/10/privacy-ubuntu-1210-amazon-ads-and-data-leaks]. If you are able to, move your containers to Debian.

## How to build this image locally

```
git clone https://github.com/cfultz/doom-docker
cd doom-docker
docker build -t cfultz/doom-docker:latest .
```