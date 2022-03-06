# use debugger (pdb)
alias db="python3 -m pdb main.py < in_1.txt"

# check
function check () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.py" ]]; then
    atcoder-tools test --exec "python3 main.py"
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && atcoder-tools test --exec "python3 main.py"
  elif [[ -d "$1" ]]; then
    cd $1 \
    && atcoder-tools test --exec "python3 main.py"
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && atcoder-tools test --exec "python3 main.py"
  else
    echo "There is no problem called $1."
    exit 1
  fi
}

# check and submit
function submit () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.py" ]]; then
    atcoder-tools submit --exec "python3 main.py" --code ./main.py --unlock-safety
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && atcoder-tools submit --exec "python3 main.py" --code ./main.py --unlock-safety
  elif [[ -d "$1" ]]; then
    cd $1 \
    && atcoder-tools submit --exec "python3 main.py" --code ./main.py --unlock-safety
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && atcoder-tools submit --exec "python3 main.py" --code ./main.py --unlock-safety
  else
    echo "There is no problem called $1."
    exit 1
  fi
}

# forced submit
function ffsubmit () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.py" ]]; then
    atcoder-tools submit --exec "python3 main.py" --code ./main.py --force
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && atcoder-tools submit --exec "python3 main.py" --code ./main.py --force
  elif [[ -d "$1" ]]; then
    cd $1 \
    && atcoder-tools submit --exec "python3 main.py" --code ./main.py --force
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && atcoder-tools submit --exec "python3 main.py" --code ./main.py --force
  else
    echo "There is no problem called $1."
    exit 1
  fi
}
