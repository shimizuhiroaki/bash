#!/bin/bash
SITEDIR_APACHE=/etc/apache2/sites-enabled
SITEDIR_NGINX=/etc/nginx/sites-enabled
IGNORESITES=000-default
HTTP="http://"
HTTPS="https://"

### サイトがapacheで動作しているか、nginxで動作しているか判断する ###
if [ `ps ax | grep [a]pache | wc -l` -ne 0 ];then
WEBSERVER=APACHE
elif [ `ps ax | grep [n]ginx | wc -l` -ne 0 ];then
WEBSERVER=NGINX
else
echo "webserver is NOT working."
exit 1
fi

### サイトリストを表示する ###
SITEDIR=SITEDIR_`echo $WEBSERVER`
SITELISTS=`ls ${!SITEDIR}`

for SITE in $SITELISTS
do
	# IGNOREに含まれているサイトを除去、.localや.confで終了するものも除去する
	echo $HTTPS$SITE
	echo $HTTP$SITE
done


exit 0
