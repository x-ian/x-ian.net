---
title: "Resume rsync transfer after SSH connection crash"
date: "2009-05-15"
permalink: false
tags: ["admin-stuff", "post"]
---

Are you using SSH for your secure maintenance of your servers? - _Sure._

Do you copy files with SCP between hosts? - _Most likely._

Is there a need to transfer big files over slow and unreliable network connections (\*)? - _Could be._

Can SCP resume a download after the connection crashed? - **_No._**

So why not simply use rsync over SSH for your file transfer. A minor drawback is, that unless you set up a rsync daemon (not appropriate for my case) you have to call rsync manually. Sadly rsync doesn't offer something like "automatic retry in case of a connection failure". (\*\*)

Good for us, because now it's tool time again; a single bash script does the trick:

``` bash
#!/bin/sh 
# reliable file transfer

# try rsync for x times 
I=0 
MAX_RESTARTS=5 
LAST_EXIT_CODE=1 
while [ $I -le $MAX_RESTARTS ] 
do 
	I=$(( $I + 1 )) 
	echo $I. start of rsync 
	rsync -av --partial --progress -e "ssh" x-ian@x-ian.net:~/MY_BIG_FILE . 
	LAST_EXIT_CODE=$? 
	if [ $LAST_EXIT_CODE -eq 0 ]; then 
		break 
	fi 
done

# check if successful 
if [ $LAST_EXIT_CODE -ne 0 ]; then 
	echo rsync failed for $I times. giving up. 
else 
	echo rsync successful after $I times. 
fi 
```

Ah, just a sidenote as I always forget the syntax: If you need to remote execute a command via SSH with variables from your local shell, take this:

``` bash
CMD="test -e M\_BIG\_FILE || cp MY\_BIG\_FILE \`hostname -s\`-MY\_BIG\_FILE" 
ssh x-ian@x-ian.net $CMD 
```

--

(\*) If you only have an unstable satellite link, even 150 MB are way too big. (\*\*) Make sure that you actually test over the network; using rsync with source and destination files on the same system deactivates the delta-calculation algorithm.
