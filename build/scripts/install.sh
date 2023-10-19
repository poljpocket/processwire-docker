#!/bin/bash

version=$1

git clone --depth 1 --branch "$version" https://github.com/processwire/processwire.git .

rm -rf .git

chown -R www-data:www-data .

mv htaccess.txt .htaccess
