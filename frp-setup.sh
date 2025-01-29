#!/bin/bash

. ./set-variables.sh

envsubst < ~/aq/scripts/templates/template_etc_frpc.ini > just_testing.conf

