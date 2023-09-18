#!/bin/bash

USER_ID=$(id -u)
PW_VERSION="3.0.227"

export USER_ID
export PW_VERSION

docker compose build
