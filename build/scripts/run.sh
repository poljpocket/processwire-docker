#!/bin/bash

if [[ ! -f ./site/assets/installed.php ]]; then
  cp -rT site-blank site
  chown -R www-data:www-data site
else
  rm -rf site-blank
  rm -f install.php
fi;

apache2-foreground
