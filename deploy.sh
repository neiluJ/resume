#!/bin/bash

WORKDIR="../resume-workdir/"
PHP_BIN=`which php`
GIT_REPO="git@github.com:neiluJ/resume.git"
GIT_BIN=`which git`
GIT_BRANCH="gh-pages"
RSYNC_BIN=`which rsync`
THEME_DIR="themes/bulma"
INIT_PWD=$PWD

if [ ! -d $WORKDIR ];then
    echo "Init working directory $WORKDIR ... ";
	$GIT_BIN clone -b $GIT_BRANCH $GIT_REPO $WORKDIR
fi

echo "Generating/Copying assets..."
cd "$THEME_DIR" && npm run deploy
cd "$INIT_PWD"
mkdir -p "$WORKDIR/$THEME_DIR/assets"
$RSYNC_BIN -rtvu --delete "$THEME_DIR/assets" "$WORKDIR/$THEME_DIR"
echo "Generating CV"
$PHP_BIN $PWD/index.php >> index.html

if [ -f $PWD/index.html ]; then
	echo "Copying files..."
	cp ./index.html "$WORKDIR/index.html"
	cp ./robots.txt "$WORKDIR/robots.txt"
fi

echo "Deploying changes..."
cd $WORKDIR
$GIT_BIN add .
$GIT_BIN commit -m "deploy"
$GIT_BIN push origin $GIT_BRANCH

echo "Cleaning up"
rm ./index.html

echo "DEPLOY OK!"