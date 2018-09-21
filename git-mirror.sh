#!/bin/bash

# Git Add Config 
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

# Git Hub Repository 
git clone --mirror https://github.com/vinodibs/Automations-Scripts.git replica
cd replica/

# Code Commit Repository
git remote add sync https://git-codecommit.us-east-1.amazonaws.com/v1/repos/codecommit

# Sync Between Git Hub & Code Commit Repository
git fetch -p origin
git push sync --mirror

# Croning 
# * * * * * cd ~/Documents/replica/ && git fetch -p origin && git push sync --mirror