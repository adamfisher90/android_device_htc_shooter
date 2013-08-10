#/bin/sh

UPDATE_PACKAGE=$1

if [ "x$UPDATE_PACKAGE" = "x" ]; then
    echo You must specify the update.zip as first argument
    exit
fi

BASE=../../../vendor/htc/shooter/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE ]; then
    mkdir -p $BASE
  fi
  unzip -j -o ${UPDATE_PACKAGE} system/$FILE -d $BASE
done

./setup-makefiles.sh
