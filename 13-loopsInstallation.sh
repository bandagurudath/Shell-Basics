#!/bin/bash

for i in $@
do
dnf install $i -y
done