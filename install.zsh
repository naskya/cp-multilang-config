#!/bin/zsh

if [[ -f "$HOME/.cpconfig" ]]; then
  echo "This script is not intended to be run more than once." && \
  echo "You don't need to run this when you add|remove|modify config files." && \
  echo "Nevertheless, if you corrupt ~/.cpconfig, answer \"y\".\n" && \
  echo -n "Are you sure you want to overwrite the existing settings? [y/N] " && \

  if ! read -q; then
    echo "\nAborting." && \
    exit 0
  fi

  echo "" && \
  rm "$HOME/.cpconfig" && \
else
  echo "\nsource $HOME/.cpconfig" >> "$HOME/.zshrc" && \
fi

rm -f "$HOME/.cplanguage" && \
touch "$HOME/.cplanguage" && \

cat << EOS > "$HOME/.cpconfig" && \
cp_config_directory="`dirname ${0:a}`/config"

if [[ -s \$HOME/.cplanguage ]]; then
  source "\$cp_config_directory/\$(cat \$HOME/.cplanguage).sh"
fi

function use () {
  if [[ "\$#" -eq 1 ]] && [[ -f "\$cp_config_directory/\$1.sh" ]]; then
    rm -f "\$HOME/.cplanguage" && \
    echo \$1 > "\$HOME/.cplanguage" && \
    source "\$cp_config_directory/\$1.sh" && \
    echo "Language settings have been changed."
  else
    print -P "%F{red}\$cp_config_directory/\$1.sh%f does not exist."
  fi
}
EOS

source "$HOME/.zshrc"
