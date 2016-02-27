FROM axeclbr/forge

RUN export MODPACK_URL="http://download2099.mediafire.com/r23w5ztjhggg/f9rc1bonmfxewxs/LifeInTheWoodsHungryServer.zip" \
 && export MODPACK_FILE="LifeInTheWoodsHungryServer.zip" \
 && apk --update add curl \
 && curl -L $MODPACK_URL -o /tmp/$MODPACK_FILE \
 && unlink /opt/forge/mods && mkdir /opt/forge/mods \
 && unzip /tmp/$MODPACK_FILE -d /opt/forge/mods/ \
 && rm -rf \
   /var/cache/apk/*
