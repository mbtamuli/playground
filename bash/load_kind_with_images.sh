#!/bin/bash

# ============ Helpers ============
Res='\e[0m'
Blu='\e[0;34m'
Gre='\e[0;32m'
Bold='\e[1;39m'

function log_error() {
    echo -e "[$(date --iso-8601=seconds)][${Red}ERROR${Res}]  $1"
}

function log_action() {
    echo -e "[$(date --iso-8601=seconds)][${Gre}ACTION${Res}]  $1"
}

function log_warning() {
    echo -e "[$(date --iso-8601=seconds)][${Yel}WARNING${Res}]  $1"
}

function log_notice() {
    echo -e "[$(date --iso-8601=seconds)][${Blu}NOTICE${Res}]  $1"
}
# ============ Helpers ============

[[ $DEBUG_MODE == "true" ]] && set -ex
[[ -z "$1" ]] \
    && { log_notice "Defaulting to Kind cluster ${Bold}kind${Res}"; KIND_CLUSTER="kind"; } \
    || { log_notice "Running on Kind cluster ${Bold}$1${Res}"; KIND_CLUSTER="$1"; }

images=(
    docker.elastic.co/eck/eck-operator:1.1.2
    docker.elastic.co/kibana/kibana:7.8.0
    docker.elastic.co/elasticsearch/elasticsearch:7.8.0
)

function image_exists_locally() {
    local image="$1"
    [[ $(docker image ls "$image" -q | wc -l) -eq 1 ]]
}

function pull_image_from_remote() {
    local image="$1"
    docker pull $image
}

function cluster_exists() {
    [[ $(kind get clusters --quiet) == *"$KIND_CLUSTER"* ]]
}

function load_images_into_kind_cluster() {
    if ! cluster_exists; then
        log_notice "Kind cluster ${Bold}$KIND_CLUSTER${Res} doesn't exists. Exiting..."
        exit 255;
    fi

    for image in ${images[@]}; do
        if ! image_exists_locally "$image"; then
            log_notice "$image image doesn't exist"
            log_action "Pulling $image..."
            pull_image_from_remote $image
        fi
        log_action "Loading $image onto Kind cluster ${Bold}$KIND_CLUSTER${Res}..."
        kind load docker-image --name "$KIND_CLUSTER" $image
    done
}

load_images_into_kind_cluster
