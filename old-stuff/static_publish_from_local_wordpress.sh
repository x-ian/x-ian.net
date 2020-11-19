#!/bin/bash
# mirrors and uploads a wordpress blog to a static web site
# check http://x-ian.net for details

# my configs
LOCAL_WORDPRESS=192.168.1.51
REMOTE_WORDPRESS=x-ian.net
SSH_LOGIN=neumann@marsgeneral.com
REMOTE_HTTP_DIR=x-ian.net

# preparation
cd /tmp
rm -rf wordpress_mirror
mkdir wordpress_mirror
cd wordpress_mirror

############## wget part

# mirror of whole wordpress installation in static html pages
wget -nv --mirror -R xmlrpc.php,trackback http://$LOCAL_WORDPRESS

# manually patch additional files
pushd .
cd $LOCAL_WORDPRESS/wp-content/plugins
tar xzf ../../../../static_publish_from_local_wordpress_syntaxhighlighter.tgz
popd

# replace remaining links with real server
find ./$LOCAL_WORDPRESS -type f -exec sed -i "" "s/`echo $LOCAL_WORDPRESS`/`echo $REMOTE_WORDPRESS`/g" {} \;

############## httrack

# httrack http://$LOCAL_WORDPRESS -O . "+.$LOCAL_WORDPRESS/*"

# upload static html pages
cd $LOCAL_WORDPRESS
tar czf ../wordpress_mirror.tgz .
scp ../wordpress_mirror.tgz $SSH_LOGIN:
ssh $SSH_LOGIN "rm -rf x-ian.net; mkdir x-ian.net; cd x-ian.net; tar xzf ../wordpress_mirror.tgz"

# cleanup
rm -rf /tmp/wordpress_mirror*
ssh $SSH_LOGIN "rm wordpress_mirror.tgz"
