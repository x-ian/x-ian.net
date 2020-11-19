---
title: "Shell perls"
date: "2012-01-29"
permalink: false
tags: ["admin-stuff", "post"]
---

As I always forget them, I just put them down right now right here (they were sitting for too long in my Drafts folder). And I might update them as I go.

**Replace multiple chars**

``` bash
sed "s/=ABC=//g"
```

**Grep for multiple words**

I know, I know. This shouldn't be here, but I kept on forgetting it...

``` bash
egrep "FULL|bytes|speedup" snapback.log
```

**Calculate size of directories**

``` bash
du --max-depth=1 -h .
```

**Not sure what I did with this, but it seems pretty important...**

``` bash
NUMBER=$[ ( $RANDOM % 100 ) + 1 ] 
cat servers | while read line; do ./collect_authorized_keys.sh $line done; done 
awk -F":" '{ print $1 }' /etc/passwd 
cat tt | while read line; do export NUMBER=$[$NUMBER + $line]; echo $NUMBER total size &gt; s1; done;
```

**Replacing newlines**

My first thought about replacing newlines in files would have been sed, but it is [not](http://funarg.nfshost.com/r2/notes/sed-return-comma.html). tr is the way to go:

``` bash
cat file | tr 'n' ',' 
```

To not only replace line endings, but also text before or after them, give this a try:

``` bash
sed -n '1h;2,$H;${g;s/n/,/g;p}' <file> 
```

**Simulate system load**

``` bash
dd if=/dev/zero bs=100M | gzip | gzip -d | gzip | gzip -d | gzip | gzip -d > /dev/null &amp; 
```

**Howto kill all child processes of a (bash) process**

Killing a single process is easy; killing multiple processes also. But only if you know all of the PIDs. If you need to kill a process including all children (sub-processes), try this one:

``` bash
ps -o pid= --ppid $PID_TO_KILL | xargs kill 
```

(Note that there are a [gazillion](http://www.unix.com/unix-dummies-questions-answers/5245-script-kill-all-child-process-given-pid.html) [solutions](http://www.linuxforums.org/forum/redhat-fedora-linux-help/115955-how-kill-process-after-specific-time.html) out there, but they all seem to be a bit over-complicated. Or I'm missing something..)

**Check if a process is running**

``` bash
kill -0 pid 2>/dev/null 
echo $? 
```
