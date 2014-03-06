![](https://31.media.tumblr.com/552693d1054ae7ca32fea61d0d9e7c58/tumblr_inline_n1xikgELLC1qav7i4.png)


**tl;dr: Update to Java 7.  [Java 7 JDK here](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html), [script to fix bash symlinks here](https://github.com/amussey/blog-posts/blob/master/2014/03_OSX-10.8-Java7-Update/update_java_path.sh).**

I ran into an issue while booting [Foreman](http://theforeman.org/) earlier:

![](https://31.media.tumblr.com/46c712b09d28994d5c107d16a4a6f812/tumblr_inline_n1xiief3uM1qav7i4.png)

Googling didn't bring in many results, so after a long chase down the rabbit hole, I found the ultimate problem: despite having Java 7 installed, my terminal was still using the Apple-provided Java 6:

![](https://31.media.tumblr.com/9bb44306ad240ec55bbde844ae8245f9/tumblr_inline_n214i98q1Y1qav7i4.png)

You can verify this using the `java -version` command.

To fix this error, make sure that you have Java 7 downloaded and installed.  You can grab this from this page:

http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

You'll want to the [Mac OS X x64 dmg](http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-macosx-x64.dmg).

This install does not replace the $PATH binaries used by bash.  You can verify this using the `whereis java` command:

![](https://31.media.tumblr.com/4958570389fe6d71a0c36110997df908/tumblr_inline_n214gyBfTZ1qav7i4.png)


The files located at `/usr/bin/java` are symlinks to the actual java install directory (verified through `ls -lha /usr/bin/ | grep JavaVM`):

![](https://31.media.tumblr.com/6d868b1fcba2fd704d2812b6a50ef8e1/tumblr_inline_n214eqkiZN1qav7i4.png)

The new binaries that you downloaded and installed are located in the directory `/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home/bin/`.  To fix this, you'll need to replace the symlinks in `/usr/bin/`.  I've written as script to take care of this that you can grab from here:

https://github.com/amussey/blog-posts/blob/master/2014/03_OSX-10.8-Java7-Update/update_java_path.sh

Download and run that from the terminal to create new symlinks in `/usr/bin/`, and to move the old binaries to `/usr/bin/old-java/`.

Thanks to [this Stack Overflow](http://stackoverflow.com/questions/12757558/installed-java-7-on-mac-os-x-but-terminal-is-still-using-version-6) thread for helping in my investigation. If you have any issues or corrections, feel free to submit a pull request to the github page or comment in the section below.
