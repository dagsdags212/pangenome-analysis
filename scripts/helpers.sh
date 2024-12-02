#!/usr/bin/env bash

function check_env() {
  local env=$1
  result=$(micromamba env list | grep $env)
  if [ ! "$result" ]; then
    echo 1
  else
    echo 0
  fi
}

function install_mamba_env() {
  local env=$1
  local target="../${env}.yml"
  if [ ! -f "${target}" ]; then
    echo "YAML file does not exist."
    exit 1
  fi
  micromamba create -n ${env} -f ../${env}.yml
}
