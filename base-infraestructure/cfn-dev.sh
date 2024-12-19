#!/bin/bash

aws cloudformation package --template-file initial.yaml --s3-bucket most-wanted-cfn-templates --output-template-file packaged.yaml --profile personal
aws cloudformation deploy --template-file packaged.yaml --stack-name most-wanted-dev --tags project=most-wanted --capabilities CAPABILITY_NAMED_IAM --profile personal --parameter-overrides \
    ProjectName=most-wanted \
    EnvType=dev \
    minSize=1 \
    maxSize=5 \
    InstanceType=t3a.nano
aws cloudformation update-termination-protection --stack-name most-wanted-dev --enable-termination-protection --profile personal
