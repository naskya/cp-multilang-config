#!/bin/bash

if [[ -f "$HOME/.cpconfig" ]]; then
  echo "This script is not intended to be run more than once." && \
  echo "You don't need to run this when you add|remove|modify config files." && \
  echo -e "Nevertheless, if you corrupt ~/.cpconfig, answer \"y\".\n" && \
  read -n1 -p "Are you sure you want to overwrite the existing settings? [y/N] " answer && \

  if [[ $answer != [yY] ]]; then
    echo -e "\nAborting." && \
    exit 0
  fi

  echo "" && \
  rm "$HOME/.cpconfig"
else
  echo -e "\nsource $HOME/.cpconfig" >> "$HOME/.bashrc"
fi

rm -f "$HOME/.cplanguage" && \
touch "$HOME/.cplanguage" && \

cat << EOS > "$HOME/.cpconfig" && \
cp_config_directory="`cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P`/config"

if [[ -s "\$HOME/.cplanguage" ]]; then
  source "\$cp_config_directory/\$(cat \$HOME/.cplanguage).sh"
fi

function use () {
  if [[ "\$#" -eq 1 ]] && [[ -f "\$cp_config_directory/\$1.sh" ]]; then
    rm -f "\$HOME/.cplanguage" && \
    echo \$1 > "\$HOME/.cplanguage" && \
    source "\$cp_config_directory/\$1.sh" && \
    echo "Language settings have been changed."
  else
    echo -e "\033[0;31m\$cp_config_directory/\$1.sh\033[0m does not exist." && \
    exit 1
  fi
}
EOS

source "$HOME/.bashrc"
