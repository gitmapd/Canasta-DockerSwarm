#!/usr/bin/env bash

# check if git is installed
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; 
then echo "Git was not found, please install before continuing.";
     exit; 
else
     echo "Git was found on the system"
fi
