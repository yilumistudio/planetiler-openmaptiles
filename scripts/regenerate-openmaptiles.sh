#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

TAG="${1:-"v3.14"}"
echo "tag=${TAG}"

BASE_URL="${2:-"https://raw.githubusercontent.com/openmaptiles/openmaptiles/"}"
echo "base-url=${BASE_URL}"

echo "Building..."
./mvnw -DskipTests=true package

DEBUG_MODE="${3:-""}"
DEBUG_OPTIONS=""

if [ "$DEBUG_MODE" == "debug" ]; then
    echo "Debug mode enabled. Waiting for debugger to connect on port 5005..."
    DEBUG_OPTIONS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005"
fi

echo "Running..."
java $DEBUG_OPTIONS -cp target/*-with-deps.jar org.openmaptiles.Generate -tag="${TAG}" -base-url="${BASE_URL}"

echo "Formatting..."
./scripts/format.sh
