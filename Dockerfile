FROM axeclbr/java:jre8

WORKDIR /opt/forge

RUN apk --update add curl \
 && curl -L "http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.6.4-9.11.1.1345/forge-1.6.4-9.11.1.1345-installer.jar" -o /opt/forge/forge-installer.jar \
 && ln -s /lib/libc.musl-x86_64.so.1 /usr/lib/libc.musl-x86_64.so.1 \
 && ln -s /lib/libz.so.1 /usr/lib/libz.so.1 \
 && java -jar /opt/forge/forge-installer.jar --installServer \
 && apk del curl \
 && rm -rf \
    /opt/forge/forge-installer.jar \
    /var/cache/apk/* 

# Create symbolic links to files provided in datacontainer
#RUN mkdir /data \
# && for file in \
#        banned-ips.txt \
#        banned-players.txt \
#        ops.txt \
#        server.log \
#        server.properties \
#        white-list.txt; \
#    do ln -s /data/$file /opt/forge/$file; done \
# && mkdir -p /data/mods && ln -s /data/mods /opt/forge/mods \
# && mkdir -p /data/world && ln -s /data/world /opt/forge/world

#RUN apk --update add curl \
# && curl -L http://download2099.mediafire.com/kxdu6dtwqd6g/f9rc1bonmfxewxs/LifeInTheWoodsHungryServer.zip -o /tmp/LifeInTheWoodsHungryServer.zip \
# && rm -rf \
#    /var/cache/apk/*

WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD ["java", "-jar", "/opt/forge/minecraftforge-universal-1.6.4-9.11.1.1345.jar"]

