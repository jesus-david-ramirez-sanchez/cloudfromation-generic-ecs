#!/bin/bash

aws cloudformation deploy --template-file ./../../microservicio.yaml --stack-name most-wanted-dev-api --capabilities CAPABILITY_NAMED_IAM --profile clicoh-arg --parameter-overrides \
    ProjectName=most-wanted \
    EnvType=dev \
    MicroserviceName=api \
    MemoryReservation=150 \
    MicroservicePort=4050 \
    MicroservicePriority=1 \
    Healthcheck=api/healthcheck \
    PathService=api \
    Initial=false \
    MinContainers=1 MaxContainers=2
