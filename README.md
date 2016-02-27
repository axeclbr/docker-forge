# Docker-Forge

Minecraft Forge in Docker

## Example with Modpack ["Life in the Woods"](docker create -v /data --name litw_data axeclbr/data /bin/true)

### Create default settings

Create data container:

    docker create -v /data --name litw_data axeclbr/data /bin/true

Let Minecraft create default files (settings etc.) in data container:

    docker run --rm -it --volumes-from litw_data axeclbr/forge

Kill container with **Ctrl+C**

### Customize settings

Mount data volumes into container with edit abilities, like this:

    docker run --rm -it --volumes-from litw_data axeclbr/workbench

    # Move to data dir	
    $ cd /data
    
    # Download Server-Modpack (link may change, please take a [look to the website](http://www.lifeinthewoods.ca/life.html))
    $ curl -L http://[...].com/[...]/LifeInTheWoodsHungryServer.zip" -o /tmp/LifeInTheWoodsHungryServer.zip 
    $ unzip /tmp/LifeInTheWoodsHungryServer.zip -d /data/mods/

**Important**: Change the World Generator from DEFAULT to Biomes O' Plenty. In file ``server.properties`` set ``level-type=BIOMESOP``.
Then delete the already generated world in the world folder!

### Start container your custom settings

    docker run --rm -it \
    --volumes-from litw_data \
    --net=host \
    axeclbr/forge

