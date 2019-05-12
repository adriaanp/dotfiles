#!/usr/bin/env bash

for file in ~/.shell{paths,vars,aliases,functions,local}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;