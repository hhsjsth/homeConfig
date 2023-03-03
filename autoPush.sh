#!/bin/bash

cd /home/gtr/homeConfig/ || return
cp /home/gtr/.zsh_history /home/gtr/homeConfig/
git add -A 
git commit -m "$(date +%Y%m%d)"
git push
