#!/usr/bin/env sh

###################################################################################
# @author      : Chirs Titis
# @file        : fixlocale.sh
# @created     : Sat  4 Dec 10:53:41 2021
#
# @source : https://gist.github.com/ChrisTitusTech/f55e2fd0b39b268fed251d12bd91b5e8
###################################################################################

echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen en_US.UTF-8

