#!/bin/bash

script_dir=$(dirname "$0")

cp -r $script_dir/usr /

chmod +x /usr/bin/php-project-setup