#!/bin/sh
a=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
b=$(basename "$1" .java)
javac $1
~/Android/Sdk/build-tools/26.0.2/dx --dex --output=classes.dex $b".class"
d2j-baksmali classes.dex
rm -rf $b".class" classes.dex
vim classes-out/$b".smali"
