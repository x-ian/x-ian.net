---
title: "Stop a long running shell/bash process after timeout"
date: "2009-09-10"
permalink: false
tags: ["admin-stuff", "post"]
---

Sometimes a process should just run for a maximum amount of time. A nightly long network transfer, a backup, or a statistical report shouldn't accidentally run until next business hours. A watchdog timer which kills a process once a certain time has passed by is needed. As usual in Shell programming multiple ways are possible, all of them have certain drawbacks. The simplest one would be just to call the long running process in the background and [capture its PID](http://www.linuxforums.org/forum/redhat-fedora-linux-help/115955-how-kill-process-after-specific-time.html). But then it is not that easy to capture the [return](http://blog.apokalyptik.com/2008/12/05/bash-collecting-the-return-value-of-backgrounded-processes) [value](http://jeremy.zawodny.com/blog/archives/010717.html) of it. Here is my shot with an additional _at_ job: 

``` bash
#!/bin/sh
MY_PID=$$
TIMEOUT=1 # in minutes

# Install at job as watchdog to remove long running process
WATCHDOG_CMDFILE=/tmp/`basename $0`-$MY_PID
echo &amp;quot;# watchdogfile script&amp;quot; &amp;gt; $WATCHDOG_CMDFILE
echo &amp;quot;kill -0 `echo $MY_PID` 2&amp;gt;/dev/null&amp;quot; &amp;gt;&amp;gt; $WATCHDOG_CMDFILE
echo &amp;quot;if [ $? -eq 0 ]; then&amp;quot; &amp;gt;&amp;gt; $WATCHDOG_CMDFILE
echo &amp;quot;  ps -o pid= --ppid `echo $MY_PID` | xargs kill&amp;quot; &amp;gt;&amp;gt; $WATCHDOG_CMDFILE
echo &amp;quot;  echo &amp;quot;long running process aborted because it ran too long&amp;quot;&amp;quot; &amp;gt;&amp;gt; $WATCHDOG_CMDFILE
echo &amp;quot;fi&amp;quot; &amp;gt;&amp;gt; $WATCHDOG_CMDFILE
echo &amp;quot;rm -f `echo $WATCHDOG_CMDFILE`&amp;quot; &amp;gt;&amp;gt; $WATCHDOG_CMDFILE
at -f $WATCHDOG_CMDFILE now + $TIMEOUT min

# Start my very sophisticated long running task
sleep 3600 # 1 hour
RET=$?

# do whatever you normally do after the long running process finishes
echo $RET
``` 

(Note that _at_ sends out emails with the stdout/stderr. If you have another notification method to indicate an aborted job, ensure that nothing is printed to std & stderr.)
