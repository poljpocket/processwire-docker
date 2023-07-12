#!/bin/bash

USER_ID=$(id -u)
PW_VERSION="3.0.210"

export USER_ID
export PW_VERSION

docker compose build
