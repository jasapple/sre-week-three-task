#! /bin/bash

NAMESPACE="sre"
DEPLOYMENT="swype-app"
MAX_RETRY=4
SLEEP_TIME=60


while true; do
    RESTARTS=$(kubectl -n ${NAMESPACE} get pods -l app=${DEPLOYMENT} -o jsonpath="{.items[0].status.containerStatuses[0].restartCount}")

    exit_code=$?

    if [ $exit_code -ne 0 ]; then
        echo "Deployment $DEPLOYMENT not active. exiting.."
        break
    fi

    echo "Current number of restarts: ${RESTARTS}"

    if (( RESTARTS > MAX_RETRY )); then
        echo "Maximum number of restarts exceeded. Scaling down the deployment: ${DEPLOYMENT}"
        kubectl -n ${NAMESPACE} scale --replicas=0 deployment/${DEPLOYMENT} 
        break
    fi

    sleep $SLEEP_TIME
done