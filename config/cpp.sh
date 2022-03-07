IFLAGS="-isystem /path/to/boost/library -I/path/to/atcoder/library"
DFLAGS="-O0 -g3 -D_GLIBCXX_DEBUG -D_FORTIFY_SOURCE=2 -fsanitize=address,undefined"
OFLAGS="-O2"
WFLAGS="-Wall -Wextra -Wcast-qual -Wconversion -Wdisabled-optimization -Wdouble-promotion -Wfloat-equal -Wformat -Wformat-signedness -Winit-self -Winvalid-pch -Wlogical-op -Wpointer-arith -Wredundant-decls -Wshadow -Wunsafe-loop-optimizations -Wno-unknown-pragmas"

# compile (not optimized)
alias cx="g++ -std=gnu++17 -o a -DLOCAL $IFLAGS $DFLAGS $WFLAGS main.cpp"

# compile (optimized)
alias fx="g++ -std=gnu++17 -o a -DLOCAL $IFLAGS $OFLAGS $WFLAGS main.cpp"

# use debugger (gdb)
alias db="gdb ./a --eval-command=\"run < in_1.txt\""

# check (not optimized)
function check () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.cpp" ]]; then
    cx \
    && atcoder-tools test --exec ./a
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && cx \
    && atcoder-tools test --exec ./a
  elif [[ -d "$1" ]]; then
    cd $1 \
    && cx \
    && atcoder-tools test --exec ./a
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && cx \
    && atcoder-tools test --exec ./a
  else
    echo "There is no problem called $1."
    exit 1
  fi
}

# check (optimized)
function fcheck () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.cpp" ]]; then
    fx \
    && atcoder-tools test --exec ./a
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && fx \
    && atcoder-tools test --exec ./a
  elif [[ -d "$1" ]]; then
    cd $1 \
    && fx \
    && atcoder-tools test --exec ./a
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && fx \
    && atcoder-tools test --exec ./a
  else
    echo "There is no problem called $1."
    exit 1
  fi
}

# check and submit (not optimized)
function submit () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.cpp" ]]; then
    cx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && cx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  elif [[ -d "$1" ]]; then
    cd $1 \
    && cx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && cx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  else
    echo "There is no problem called $1."
    exit 1
  fi
}

# check and submit (optimized)
function fsubmit () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.cpp" ]]; then
    fx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && fx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  elif [[ -d "$1" ]]; then
    cd $1 \
    && fx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && fx \
    && atcoder-tools submit --exec ./a --code ./main.cpp --unlock-safety
  else
    echo "There is no problem called $1."
    exit 1
  fi
}

# forced submit
function ffsubmit () {
  if [[ "$#" -eq 0 ]] && [[ -f "./main.cpp" ]]; then
    atcoder-tools submit --exec ./a --code ./main.cpp --force
  elif [[ "$#" -eq 0 ]]; then
    cd A \
    && atcoder-tools submit --exec ./a --code ./main.cpp --force
  elif [[ -d "$1" ]]; then
    cd $1 \
    && atcoder-tools submit --exec ./a --code ./main.cpp --force
  elif [[ -d "../$1" ]]; then
    cd ../$1 \
    && atcoder-tools submit --exec ./a --code ./main.cpp --force
  else
    echo "There is no problem called $1."
    exit 1
  fi
}
