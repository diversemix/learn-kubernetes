#!/bin/bash

set -e

source ./tutorial/funcs.sh

# clear
# cat ./tutorial/learn-kubernetes
# cat ./tutorial/intro

# wait

# cat ./tutorial/starting

# wait

# clear
# echo
# echo docker ------------------------------------------------------------------------
# check_command docker -v 
# check_command docker ps 
# echo
# echo minikuke ----------------------------------------------------------------------
# check_command minikube version
# echo
# echo kubectl -----------------------------------------------------------------------
# check_command kubectl version --client --short=true
# echo

# all_good

# wait

# cat ./tutorial/minikube-start

# wait

# clear
# check_long_command minikube start
# echo
# echo "Let's check the profile -------------------------------------------------------"
# echo

# check_command minikube profile list
# check command kubectl cluster-info

# all_good

# wait
clear
cat ./tutorial/learn-kubernetes
cat ./tutorial/start-nginx
export GREP_COLORS="ms=1;36"
cat ./basic-nginx/nginx-pod.yml  | grep --color=always -E .*: 
echo

wait
clear
pwd
check_long_command kubectl create -f ./basic-nginx/nginx-pod.yml --save-config