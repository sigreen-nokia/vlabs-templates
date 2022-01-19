#!/bin/bash

CHECK_FAILED="false"
if [ -z ${AWS_ACCESS_KEY_ID} ];
then
    echo "export AWS_ACCESS_KEY_ID=\"[you setting]\""
    echo "then try again"
    CHECK_FAILED="true"
fi
if [ -z ${AWS_SECRET_ACCESS_KEY} ];
then
    echo "export AWS_SECRET_ACCESS_KEY=\"[you setting]\""
    echo "then try again"
    CHECK_FAILED="true"
fi
if [ -z ${AWS_DEFAULT_REGION} ];
then
    echo "export AWS_DEFAULT_REGION=\"[you setting]\""
    echo "then try again"
    CHECK_FAILED="true"
fi
if [ -z ${AWS_KEY_NAME} ];
then
    echo "export AWS_KEY_NAME=\"[you setting]\""
    echo "then try again"
    CHECK_FAILED="true"
fi
if [ -z ${GITHUB_USERNAME} ];
then
    echo "export GITHUB_USERNAME=\"[you setting]\""
    echo "then try again"
    CHECK_FAILED="true"
fi
if [ -z ${GITHUB_PASSWORD} ];
then
    echo "export GITHUB_PASSWORD=\"[you setting]\""
    echo "then try again"
    CHECK_FAILED="true"
fi
if [ -z ${SUBMITTER} ];
then
    echo "export SUBMITTER=\"[you setting]\""
    echo "then try again"
    CHECK_FAILED="true"
fi
if [ -z ${SSH_KEY} ];
then
    echo "setting SSH_KEY to your public key files as it was not set in environments"
    SSH_KEY=`cat ~/.ssh/id_rsa.pub`
fi
if [ $CHECK_FAILED = "true" ]; then
     return
fi

cp $1 vlmgr.json 
sed -i .bak "s/\[AWS_ACCESS_KEY_ID\]/${AWS_ACCESS_KEY_ID}/" vlmgr.json
sed -i .bak "s#\[AWS_SECRET_ACCESS_KEY]#${AWS_SECRET_ACCESS_KEY}#" vlmgr.json
sed -i .bak "s/\[AWS_DEFAULT_REGION]/${AWS_DEFAULT_REGION}/" vlmgr.json
sed -i .bak "s/\[AWS_KEY_NAME]/${AWS_KEY_NAME}/" vlmgr.json
sed -i .bak "s/\[GITHUB_PASSWORD]/${GITHUB_PASSWORD}/" vlmgr.json
sed -i .bak "s/\[GITHUB_USERNAME]/${GITHUB_USERNAME}/" vlmgr.json
sed -i .bak "s#\[SSH_KEY]#${SSH_KEY}#" vlmgr.json
sed -i .bak "s/\[SUBMITTER]/${SUBMITTER}/" vlmgr.json

