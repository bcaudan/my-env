
id=${1}
distributionId=${2-E24HI6P9ZROFKJ}
while [ -n "$(aws cloudfront get-invalidation --id $id --distribution-id $distributionId | grep InProgress)" ]
do
	sleep 10
done
