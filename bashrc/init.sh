#!/bin/bash

function add_bashrc() {
  if [ $(cat ~/.bashrc | fgrep "$1" | wc -l) -eq 0 ]; then
    echo "$1" >> ~/.bashrc
  fi
}


add_bashrc "alias ls='ls -al'"

add_bashrc "alias tfi='terraform init'"
add_bashrc "alias tfv='terraform validate'"
add_bashrc "alias tfp='terraform plan'"
add_bashrc "alias tfa='terraform apply -auto-approve'"
add_bashrc "alias tfd='terraform destroy -auto-approve'"

add_bashrc "alias ga='git add'"
add_bashrc "alias gc='git commit'"
add_bashrc "alias gp='git push'"
add_bashrc "alias gpl='git pull'"
add_bashrc "alias gr='git reset --soft'"
add_bashrc "alias grh='git reset --hard'"

source ~/.bashrc

