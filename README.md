# Docker-Forge

Minecraft Forge 1.6.4 in Docker

[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/axeclbr/forge/latest.svg?style=flat-square)](https://imagelayers.io/?images=axeclbr/forge:latest)
[![Twitter Follow](https://img.shields.io/twitter/follow/axeclbr.svg?style=social)](https://twitter.com/intent/follow?screen_name=axeclbr)

## Usage

Example with Modpack ["Life in the Woods"](http://www.lifeinthewoods.ca/life.html)

### Create default settings

Create data container:

    docker create -v /data --name litw_data axeclbr/data /bin/true

Let Minecraft create default files (settings etc.) in data container:

    docker run --rm -it --volumes-from litw_data axeclbr/forge

Kill container with **Ctrl+C**

### Customize settings

First copy the download-link from the server-version of the Modpack from the [Life-In-The-Woods-Website](http://www.lifeinthewoods.ca/life.html).

Mount data volumes into container with edit abilities, like this:

    docker run --rm -it --volumes-from litw_data axeclbr/workbench

    # Move to data dir	
    $ cd /data
    
    # Download Server-Modpack
    $ curl -L [Download-Link from above] -o /tmp/LifeInTheWoodsHungryServer.zip 
    $ unzip /tmp/LifeInTheWoodsHungryServer.zip -d /data/mods/

### Update World Generator

Change the World Generator from DEFAULT to Biomes O' Plenty.

In file ``server.properties`` set ``level-type=BIOMESOP``.

Then delete the already generated world in the world folder!

### Start container with your custom settings

With default memory:

    docker run --rm -it \
    --volumes-from litw_data \
    --net=host \
    axeclbr/forge

With more RAM and in background:

    docker run -d \
    --volumes-from litw_data \
    --net=host \
    axeclbr/forge \
    java -Xmx1024M -Xms1024M -jar /opt/forge/minecraft.jar

### Backup your Minecraft data

To export the data from your data container into a tar-file, you can execute:

    docker run --rm --volumes-from litw_data -v $(pwd):/backup axeclbr/workbench tar cvf /backup/backup.tar /data

You should have a file named ``backup.tar`` in your current directory with all your important Minecraft worlds and settings in it.

