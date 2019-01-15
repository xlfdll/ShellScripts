#!/bin/bash

for repo in */;
do
	pushd $repo
	git pull;
	popd
done
