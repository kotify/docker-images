#!/usr/bin/env bash

gen () {
    local DATE=`date +%y%m%d`
    local TAG=kotify/`echo $1 | sed 's/-/:/'`
    local NAME=`echo $1 | sed 's/[^a-zA-Z0-9]/_/g'`
    local TAG_PIN=`echo $TAG | grep -q ':' && echo $TAG-$DATE || echo $TAG:$DATE`
    echo "build.$NAME:" >> Makefile
    echo "	(cd $1; docker build . --tag=$TAG)" >> Makefile
    echo "push.$NAME:" >> Makefile
    echo "	docker push $TAG" >> Makefile
    echo "pin.$NAME: build.$NAME" >> Makefile
    echo "	docker tag $TAG $TAG_PIN" >> Makefile
    echo "publish.pin.$NAME: pin.$NAME" >> Makefile
    echo "	docker push $TAG_PIN" >> Makefile
    echo "publish.$NAME: build.$NAME push.$NAME publish.pin.$NAME" >> Makefile
    echo '' >> Makefile
    echo '' >> Makefile
}

cat << EOF > Makefile
# DO NOT EDIT, AUTOGENERATED BY gen.sh

all: refresh-base-images publish.all

refresh-base-images:
	grep 'FROM' **/Dockerfile | cut -d ' ' -f 2 | xargs -L 1 docker pull


EOF

for f in `find . -name Dockerfile | rev | cut -d '/' -f 2 | rev | sort`; do gen $f; done

echo -n 'publish.all:' >> Makefile

for f in `ls | grep -`; do
    NAME=`echo $f | sed 's/[^a-zA-Z0-9]/_/g'`
    echo -n " publish.$NAME" >> Makefile;
done

echo '' >> Makefile
