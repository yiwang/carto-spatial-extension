#!/usr/bin/env bash

# Script to assign permissions to a module
# Input parameters:
# * BQ_PROJECT
# * BQ_PERMISSIONS (permissions to be added)
# * BQ_PERMISSIONS_TARGET_DATASET (dataset to add permissions to)

echo "Setting permissions to $BQ_PROJECT:$BQ_PERMISSIONS_TARGET_DATASET"

AUTH_TEMPFILE_OLD=$(mktemp -u /tmp/old_module_permissions_XXXXXXXXXXXXXXXXX)
AUTH_TEMPFILE_NEW=$(mktemp -u /tmp/new_module_permissions_XXXXXXXXXXXXXXXXX)

bq show --format=prettyjson ${BQ_PROJECT}:${BQ_PERMISSIONS_TARGET_DATASET} > ${AUTH_TEMPFILE_OLD}
jq --argjson addPermissions "$BQ_PERMISSIONS" \
   '.access += $addPermissions' ${AUTH_TEMPFILE_OLD} > ${AUTH_TEMPFILE_NEW}
bq update --source ${AUTH_TEMPFILE_NEW} ${BQ_PROJECT}:${BQ_PERMISSIONS_TARGET_DATASET}

rm -f ${AUTH_TEMPFILE_OLD}*
rm -f ${AUTH_TEMPFILE_NEW}*