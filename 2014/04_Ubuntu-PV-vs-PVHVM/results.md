# Raw Results

### From Standard (PV):

#### sysbench
```
root@test-system:~# sysbench --test=cpu --cpu-max-prime=50000 run
sysbench 0.4.12:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1

Doing CPU performance benchmark

Threads started!
Done.

Maximum prime number checked in CPU test: 50000


Test execution summary:
    total time:                          119.6241s
    total number of events:              10000
    total time taken by event execution: 119.6035
    per-request statistics:
         min:                                 11.60ms
         avg:                                 11.96ms
         max:                                 28.63ms
         approx.  95 percentile:              12.66ms

Threads fairness:
    events (avg/stddev):           10000.0000/0.00
    execution time (avg/stddev):   119.6035/0.00




root@test-system:~# sysbench --test=cpu --cpu-max-prime=50000 run
sysbench 0.4.12:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1

Doing CPU performance benchmark

Threads started!
Done.

Maximum prime number checked in CPU test: 50000


Test execution summary:
    total time:                          119.3079s
    total number of events:              10000
    total time taken by event execution: 119.2849
    per-request statistics:
         min:                                 11.60ms
         avg:                                 11.93ms
         max:                                 25.77ms
         approx.  95 percentile:              12.49ms

Threads fairness:
    events (avg/stddev):           10000.0000/0.00
    execution time (avg/stddev):   119.2849/0.00




root@test-system:~# sysbench --test=cpu --cpu-max-prime=50000 run
sysbench 0.4.12:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1

Doing CPU performance benchmark

Threads started!
Done.

Maximum prime number checked in CPU test: 50000


Test execution summary:
    total time:                          119.4660s
    total number of events:              10000
    total time taken by event execution: 119.4454
    per-request statistics:
         min:                                 11.60ms
         avg:                                 11.94ms
         max:                                 27.06ms
         approx.  95 percentile:              12.50ms

Threads fairness:
    events (avg/stddev):           10000.0000/0.00
    execution time (avg/stddev):   119.4454/0.00

```

#### hdparam

```
root@test-system:~# hdparm -Tt /dev/xvda1

/dev/xvda1:
 Timing cached reads:   17140 MB in  1.97 seconds = 8690.97 MB/sec
 Timing buffered disk reads: 1178 MB in  3.00 seconds = 392.04 MB/sec


root@test-system:~# hdparm -Tt /dev/xvda1

/dev/xvda1:
 Timing cached reads:   16338 MB in  1.97 seconds = 8281.13 MB/sec
 Timing buffered disk reads: 1206 MB in  3.00 seconds = 401.78 MB/sec


root@test-system:~# hdparm -Tt /dev/xvda1

/dev/xvda1:
 Timing cached reads:   16772 MB in  1.97 seconds = 8506.62 MB/sec
 Timing buffered disk reads: 1216 MB in  3.00 seconds = 405.08 MB/sec

```

#### dd

```
root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.177522 s, 473 MB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.180386 s, 465 MB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.180846 s, 464 MB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.178138 s, 471 MB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.18079 s, 464 MB/s
```


### From PVHVM:

#### sysbench

```
root@test-system:~# sysbench --test=cpu --cpu-max-prime=50000 run
sysbench 0.4.12:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1

Doing CPU performance benchmark

Threads started!
Done.

Maximum prime number checked in CPU test: 50000


Test execution summary:
    total time:                          118.3799s
    total number of events:              10000
    total time taken by event execution: 118.3696
    per-request statistics:
         min:                                 11.60ms
         avg:                                 11.84ms
         max:                                 24.57ms
         approx.  95 percentile:              12.30ms

Threads fairness:
    events (avg/stddev):           10000.0000/0.00
    execution time (avg/stddev):   118.3696/0.00




root@test-system:~# sysbench --test=cpu --cpu-max-prime=50000 run
sysbench 0.4.12:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1

Doing CPU performance benchmark

Threads started!
Done.

Maximum prime number checked in CPU test: 50000


Test execution summary:
    total time:                          118.5267s
    total number of events:              10000
    total time taken by event execution: 118.5165
    per-request statistics:
         min:                                 11.59ms
         avg:                                 11.85ms
         max:                                 25.09ms
         approx.  95 percentile:              12.43ms

Threads fairness:
    events (avg/stddev):           10000.0000/0.00
    execution time (avg/stddev):   118.5165/0.00





root@test-system:~# sysbench --test=cpu --cpu-max-prime=50000 run
sysbench 0.4.12:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1

Doing CPU performance benchmark

Threads started!
Done.

Maximum prime number checked in CPU test: 50000


Test execution summary:
    total time:                          118.6532s
    total number of events:              10000
    total time taken by event execution: 118.6426
    per-request statistics:
         min:                                 11.59ms
         avg:                                 11.86ms
         max:                                 25.28ms
         approx.  95 percentile:              12.47ms

Threads fairness:
    events (avg/stddev):           10000.0000/0.00
    execution time (avg/stddev):   118.6426/0.00
```

#### hdparm

```
root@test-system:~# hdparm -Tt /dev/xvda1

/dev/xvda1:
 Timing cached reads:   17696 MB in  1.99 seconds = 8892.51 MB/sec
 Timing buffered disk reads: 978 MB in  3.00 seconds = 325.68 MB/sec


root@test-system:~# hdparm -Tt /dev/xvda1

/dev/xvda1:
 Timing cached reads:   18084 MB in  1.99 seconds = 9088.12 MB/sec
 Timing buffered disk reads: 980 MB in  3.00 seconds = 326.27 MB/sec


root@test-system:~# hdparm -Tt /dev/xvda1

/dev/xvda1:
 Timing cached reads:   18128 MB in  1.99 seconds = 9110.35 MB/sec
 Timing buffered disk reads: 986 MB in  3.00 seconds = 328.21 MB/sec
```

#### dd

```
root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.0845894 s, 992 MB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.0798083 s, 1.1 GB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.0803015 s, 1.0 GB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.0811806 s, 1.0 GB/s

root@test-system:~# dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output
10240+0 records in
10240+0 records out
83886080 bytes (84 MB) copied, 0.083654 s, 1.0 GB/s
```
