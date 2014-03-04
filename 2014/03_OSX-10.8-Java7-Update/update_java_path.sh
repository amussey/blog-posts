#!/bin/bash
# This script will update the default Java symlinks in OSX 10.8
# from links to Java 6 to links to Java 7. 

mkdir /usr/bin/old-java/
mv /usr/bin/appletviewer /usr/bin/old-java/
mv /usr/bin/apt /usr/bin/old-java/
mv /usr/bin/extcheck /usr/bin/old-java/
mv /usr/bin/idlj /usr/bin/old-java/
mv /usr/bin/jar /usr/bin/old-java/
mv /usr/bin/jarsigner /usr/bin/old-java/
mv /usr/bin/java /usr/bin/old-java/
mv /usr/bin/javac /usr/bin/old-java/
mv /usr/bin/javadoc /usr/bin/old-java/
mv /usr/bin/javafxpackager /usr/bin/old-java/
mv /usr/bin/javah /usr/bin/old-java/
mv /usr/bin/javap /usr/bin/old-java/
mv /usr/bin/jcmd /usr/bin/old-java/
mv /usr/bin/jconsole /usr/bin/old-java/
mv /usr/bin/jdb /usr/bin/old-java/
mv /usr/bin/jhat /usr/bin/old-java/
mv /usr/bin/jinfo /usr/bin/old-java/
mv /usr/bin/jmap /usr/bin/old-java/
mv /usr/bin/jmc /usr/bin/old-java/
mv /usr/bin/jps /usr/bin/old-java/
mv /usr/bin/jrunscript /usr/bin/old-java/
mv /usr/bin/jsadebugd /usr/bin/old-java/
mv /usr/bin/jstack /usr/bin/old-java/
mv /usr/bin/jstat /usr/bin/old-java/
mv /usr/bin/jstatd /usr/bin/old-java/
mv /usr/bin/jvisualvm /usr/bin/old-java/
mv /usr/bin/keytool /usr/bin/old-java/
mv /usr/bin/native2ascii /usr/bin/old-java/
mv /usr/bin/orbd /usr/bin/old-java/
mv /usr/bin/pack200 /usr/bin/old-java/
mv /usr/bin/policytool /usr/bin/old-java/
mv /usr/bin/rmic /usr/bin/old-java/
mv /usr/bin/rmid /usr/bin/old-java/
mv /usr/bin/rmiregistry /usr/bin/old-java/
mv /usr/bin/schemagen /usr/bin/old-java/
mv /usr/bin/serialver /usr/bin/old-java/
mv /usr/bin/servertool /usr/bin/old-java/
mv /usr/bin/tnameserv /usr/bin/old-java/
mv /usr/bin/unpack200 /usr/bin/old-java/
mv /usr/bin/wsgen /usr/bin/old-java/
mv /usr/bin/wsimport /usr/bin/old-java/
mv /usr/bin/xjc /usr/bin/old-java/
ln -s /Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home/bin/* /usr/bin
