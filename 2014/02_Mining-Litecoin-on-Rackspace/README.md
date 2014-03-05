*Original article: [http://blog.amussey.com/post/77096711402/mining-litecoin-with-minerd-on-rackspace-cloud-servers](http://blog.amussey.com/post/77096711402/mining-litecoin-with-minerd-on-rackspace-cloud-servers)*

After an article popped up on Hacker News a couple months ago about the profitability of [mining Litecoin on EC2](https://news.ycombinator.com/item?id=6818015), it inspired me to take Rackspace's cloud servers for a mining spin.  Rackspace doesn't currently offer any GPU instances, so I had no expectation that they'd mine at the same level or even to profitability, but I was hoping that my plethora of servers that were being gently used for other projects can have their spare CPU cycles put to a bit of mining use. 

My initial test only focused on Rackspace's [new performance flavors](http://developer.rackspace.com/blog/welcome-to-performance-cloud-servers-have-some-benchmarks.html), configured Ubuntu 12.04 LTS with [updates to the latest packages](https://gist.github.com/amussey/7739936#file-minerd_test-sh-L4-L5).  The graph of the hash rates vs the threads are below:

[![ graph ](http://i.imgur.com/lx1zeRk.png)](http://i.imgur.com/lx1zeRk.png)

For those haven't worked with Rackspace's cloud server offerings, there are currently two types of servers: First Gen (pre-OpenStack servers) and Next Gen (OpenStack-based servers).  Under Next Gen, the server types can also be broken down to Standard Instances and Performance Flavors (instances containing SSDs and higher bandwidth NICs) (more technical information about the servers can be found [here](http://docs.rackspace.com/servers/api/v2/cs-releasenotes/content/supported_flavors.html)).  Because of the RAM vs CPU tradeoffs of the First Gen vs Next Gen servers, I decided to give the First Gen servers a shot with mining.

[![ graph ](http://i.imgur.com/MADlC6R.png)](http://i.imgur.com/MADlC6R.png)


However, if you flip the graph to compare the cost to run the server to the KH/s it can generate, you get the following:

[![ graph ](http://i.imgur.com/qZ7a1l7.png)](http://i.imgur.com/qZ7a1l7.png)

The cost-to-performance ratio of the 256MB First Gen server blows away the competition.  This is due to the server's four available processors (verses the one available in the 1GB Performance flavor, two in the 2GB Performance flavor, and so on).  Since Litecoin mining app minerd has little to no dependency on the system's RAM, there is a negligible impact by increasing the amount of RAM in the First Gen servers. 

These experiments aside, does this matter?  At the time I started writing this, my performance servers were achieving approximately 7.5 KH/s.  This came out to about 0.115 LTC per month, so with a $35/LTC exchange rate, this came out to around $4 per month.  Now that the price of LTC has dropped to around $15, this is only $1.73 or so.  In comparison to the ~$29 per month that it costs to run the base 1GB RAM/single core performance flavor, it is by no means worthwhile to run servers exclusively for mining (even the $11/month 256GB First Gen server won't get you to a break-even point).  However, because this is a deflationary currency, a Litecoin price jump in the future could turn these minings into profit.

If you want to try these tests out on your own server on another provider, the scripts that were used are available here:

https://gist.github.com/amussey/7739936

If you want to play with the data I generated from these tests, you can download it from here:

http://amussey.com/blog/files/LTC-raw_mining_results.zip

If you have any questions on methodolgy, feel free to contact me on Twitter [@amussey](http://twitter.com/amussey) or on [the original blog post](http://blog.amussey.com/post/77096711402/mining-litecoin-with-minerd-on-rackspace-cloud-servers).
