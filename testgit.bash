#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# check if git is installed
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; 
then echo "${RED}Git was not found, please install before continuing.${NC}";
     exit; 
else
     echo "${GREEN}Git was found on the system${NC}"
fi
