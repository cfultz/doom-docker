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

This container is built on Debian Bullseye Slim (until Zandronum updates the libssl libraries to support something better than 1.1...) instead of the spyware known as Ubuntu. Even though they abandoned the idea years ago, [people don't forget](https://www.eff.org/deeplinks/2012/10/privacy-ubuntu-1210-amazon-ads-and-data-leaks). If you are able to, move your containers to Debian.

## How to build this image locally

```
git clone https://github.com/cfultz/doom-docker
cd doom-docker
docker build -t cfultz/doom-docker:latest .
```

## What's included? 

Freedoom and the shareware version of DOOM (1993). These are legal to share so that's why they are here. If you want to change/add WADS, place them in the ``/IWAD/`` directory, and use an environmental variable to select your prefered IWAD and starting map. You can also add a custom WAD

## Licenses 

Code within freedoom1.wad, freedoom2.wad, and doom1.wad which are subject to their own licenses.

* [freedoom's](https://github.com/freedoom/freedoom/blob/master/COPYING.adoc) license

* [doom1.wad's](https://github.com/id-Software/DOOM) README 

The content of the code are subject to the [Creative Commons Zero v1.0 Unviversal](https://github.com/cfultz/doom-docker/blob/main/LICENSE) License. 