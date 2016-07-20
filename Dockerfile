# Pull base image
FROM daocloud.io/daocloud/zookeeper
MAINTAINER  gucl <gucl@asiainfo.com>
RUN mkdir -p opt-zkloader/ccsprop \
    && mkdir -p opt-zkloader/logs  \
    && mkdir -p opt-zkloader-services/config/paas \
    && mkdir -p opt-zkloader-services/libs/3rd-libs \
    && mkdir -p opt-zkloader-services/libs/core-libs 


COPY opt-zkloader/ccsprop/* ./opt-zkloader/ccsprop/
COPY opt-zkloader/loadcfg.sh ./opt-zkloader/loadcfg.sh
COPY opt-zkloader/setEnv.sh ./opt-zkloader/setEnv.sh
RUN chmod 777 ./opt-zkloader/setEnv.sh
RUN chmod 777 ./opt-zkloader/loadcfg.sh

COPY ./build/libs ./opt-zkloader-services/libs/
COPY ./build/config ./opt-zkloader-services/config/

WORKDIR /opt/zookeeper/opt-zkloader/