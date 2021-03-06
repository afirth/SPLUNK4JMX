#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Start Script for JMX MBean Poller                                       ##
##                                                                          ##
### ====================================================================== ###
CONFIG_FILE_NAME=$1

# Setup the JVM
if [ "x$JAVA" = "x" ]; then
    if [ "x$JAVA_HOME" != "x" ]; then
	JAVA="$JAVA_HOME/bin/java"
    else
	JAVA="java"
    fi
fi

ATTACH_LIBRARY_PATH=$JAVA_HOME/jre/lib/i386
SPLUNK4JMX_HOME=$SPLUNK_HOME/etc/apps/SPLUNK4JMX
MAIN_CLASS=com.dtdsoftware.splunk.JMXMBeanPoller
LIB_DIR=$SPLUNK4JMX_HOME/bin/lib
POLLER_JARS=$LIB_DIR/jmxpoller.jar:$LIB_DIR/axis.jar:$LIB_DIR/saaj.jar:$LIB_DIR/slf4j-api-1.6.4.jar:$LIB_DIR/castor-1.3-core.jar:$LIB_DIR/slf4j-log4j12-1.6.4.jar:$LIB_DIR/castor-1.3-xml.jar:$LIB_DIR/splunk.jar:$LIB_DIR/commons-discovery-0.2.jar:$LIB_DIR/splunklogging.jar:$LIB_DIR/commons-logging-1.1.1.jar:$LIB_DIR/tools-lin.jar:$LIB_DIR/hessian-3.0.8.jar:$LIB_DIR/jaxrpc.jar:$LIB_DIR/wsdl4j.jar:$LIB_DIR/log4j-1.2.16.jar:$LIB_DIR/xercesImpl.jar:$LIB_DIR/mx4j-tools.jar
JVM_MEMORY="-Xms64m -Xmx64m"
JAVA_OPTS="$JVM_MEMORY"
CONFIG_XML=$SPLUNK4JMX_HOME/bin/config/$CONFIG_FILE_NAME


"$JAVA" -Djava.library.path=$ATTACH_LIBRARY_PATH -Dsplunk4jmx.home=$SPLUNK4JMX_HOME $JAVA_OPTS -classpath $LIB_DIR:$POLLER_JARS $MAIN_CLASS $CONFIG_XML
