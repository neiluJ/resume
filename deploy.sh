#!/bin/bash

WORKDIR="../resume-workdir/"
PHP_BIN=`which php`
GIT_REPO="git@github.com:neiluJ/resume.git"
GIT_BIN=`which git`
GIT_BRANCH="gh-pages"
RSYNC_BIN=`which rsync`

if [ ! -d $WORKDIR ];then
        echo "Init working directory $WORKDIR ... ";
	$GIT_BIN clone -b $GIT_BRANCH $GIT_REPO $WORKDIR
fi

if [ -d $PWD/themes ]; then
	echo "Copying assets..."
	$RSYNC_BIN -rtvu --delete "./themes/" "$WORKDIR/themes/"
fi

echo "Generating CV"
$PHP_BIN $PWD/index.php >> index.html

if [ -f $PWD/index.html ]; then
	echo "Copying files..."
	cp ./index.html "$WORKDIR/index.html"
	cp ./robots.txt "$WORKDIR/robots.txt"
	cp ./jballestracci-dev-web.pdf "$WORKDIR/jballestracci-dev-web.pdf"
fi


echo "Deploying changes..."
cd $WORKDIR
$GIT_BIN add .
$GIT_BIN commit -m "deploy"
$GIT_BIN push origin $GIT_BRANCH

echo "DONE"
