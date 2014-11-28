#!/bin/sh
E2E_PATH="xl-release-server/src/test/javascript/e2e/scenario"
cd $E2E_PATH
HAS_DDESCRIBE=`grep -ri "ddescribe" *`
HAS_IIT=`grep -ri "iit" *`
HAS_PAUSE=`grep -ri "pause()" *`
if [ -n "${HAS_DDESCRIBE}" ] || [ -n "${HAS_IIT}" ]  || [ -n "${HAS_PAUSE}" ]
then
    echo "WARNING : There is some 'ddescribe', 'iit' or 'pause' left.";
    exit 1;
fi
cd -
exit 0
