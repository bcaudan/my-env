#!/bin/bash
readonly message="%40here%20daily%20!"
readonly channel="%40bastien"
readonly token="xoxp-2257033417-4546013330-22634983250-b8609b1b69"

curl https://slack.com/api/chat.postMessage\?token\=${token}\&channel\=${channel}\&text\=${message}\&link_names\=1\&as_user\=true\&pretty\=1
notify daily!!!
