#!/bin/sh


PROCESS_NAME="LoadConfServiceStart"
PROCESS_PARM="opt.zkloader.system=baas"
CUR_USER=`whoami`
RUNNER_PRODUCT_NAME=opt.zkloader
BIN_PATH=/opt/zookeeper/opt-zkloader
LOG_PATH=/opt/zookeeper/opt-zkloader/logs/opt-zkloader.log
CLASSPATH="${CLASSPATH}"
MEM_ARGS="-Xms256m -Xmx512m -XX:PermSize=64M -XX:MaxPermSize=128M"

. "${BIN_PATH}/setEnv.sh"

sed -i "s/ccs.zk_address=.*/ccs.zk_address=${ZK_ADDRESS}/g" ${DEPOLY_PATH}/config/paas/paas-conf.properties
        
${JAVA_HOME}/bin/java ${MEM_ARGS} -D${PROCESS_PARM}  ${JAVA_OPTIONS} com.ai.opt.sdk.appserver.LoadConfServiceStart ccsprop  >> $LOG_PATH 


tail -100f $LOG_PATH




