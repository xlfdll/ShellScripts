#!/bin/bash

echo 'int main(){}' > dummy.c
cc dummy.c
readelf -l a.out | grep 'Requesting'
rm dummy.c a.out
