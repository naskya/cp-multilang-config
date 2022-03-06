# cp-multilang-config

競技プログラミングを複数の言語でプレイするための（個人的な）設定ツールです。このツールではあなたが競技プログラミングのためだけに仮想環境を用意していて、競技プログラミングをその中でプレイしていることを想定しています（そのため、`use` という一般的な名前のコマンドを新たに作成します。名前を変えたければ [`install.bash`](https://github.com/naskya/cp-multilang-config/blob/main/install.bash) または [`install.zsh`](https://github.com/naskya/cp-multilang-config/blob/main/install.zsh) を編集してください）。

# インストール

リポジトリを clone して、そこに移動します。リポジトリの場所が設定ファイルの場所となるので、好きな位置に clone してください。

```bash
$ git clone https://github.com/naskya/cp-multilang-config.git
$ cd cp-multilang-config
```

bash をお使いの方は [`install.bash`](https://github.com/naskya/cp-multilang-config/blob/main/install.bash) を、

```sh
$ bash install.bash
```

zsh をお使いの方は [`install.zsh`](https://github.com/naskya/cp-multilang-config/blob/main/install.zsh) を実行します。

```sh
$ zsh install.zsh
```

# 設定

## 添付されている例の説明（飛ばしてもよい）

例として、C++ 用の設定（私が個人的に使用しているものを基にしています）が [`config/cpp.sh`](https://github.com/naskya/cp-multilang-config/blob/main/config/cpp.sh) に書かれています。この例では [atcoder-tools](https://github.com/kyuridenamida/atcoder-tools) の使用を想定していて、

```
.
├─ A
│  ├─ main.cpp
│  ├─ in_1.txt
│  └─ ...
├─ B
│  ├─ main.cpp
│  ├─ in_1.txt
│  └─ ...
├─ C
│  ├─ main.cpp
│  ├─ in_1.txt
│  └─ ...
└─ ...
```

のように問題ごとに分かれたディレクトリが作られているとして（このような構成は `atcoder-tools gen abc123` などで作れます）、

- `cx` でカレントディレクトリの `main.cpp` をデバッグモードでコンパイル
- `fx` でカレントディレクトリの `main.cpp` をリリースモードでコンパイル
- `check` で
    - 引数が無くカレントディレクトリに `main.cpp` が有ればそれをデバッグモードでコンパイルし、atcoder-tools でテストする
    - 引数が無くカレントディレクトリに `main.cpp` が無ければディレクトリ `A` に入り、`main.cpp` をデバッグモードでコンパイルし、atcoder-tools でテストする
    - 引数が有ればその問題のディレクトリに入り、`main.cpp` をデバッグモードでコンパイルし、atcoder-tools でテストする
- `fcheck` で `check` と同じことをする（ただしコンパイルはリリースモード）
- `submit` で `check` と同じことをする（ただしテストが通ったら提出する）
- `fsubmit` で `fcheck` と同じことをする（ただしテストが通ったら提出する）
- `ffsubmit` で `check` と同様のディレクトリの移動を行った後コンパイルもテストもせずにコードを提出する
- `db` でデバッガ(gdb)を起動し、`in_1.txt` を入力として実行させる

としています（例えば問題 D のコードをテストするなら `check D` を実行し、現在いるディレクトリのコードをテストして提出するなら `submit` を実行します）。

また、Python 3 用の設定が [`config/python.sh`](https://github.com/naskya/cp-multilang-config/blob/main/config/python.sh) に書かれています。この設定では

- `check` で
    - 引数が無くカレントディレクトリに `main.py` が有ればそれを atcoder-tools でテストする
    - 引数が無くカレントディレクトリに `main.py` が無ければディレクトリ `A` に入り、`main.py` を atcoder-tools でテストする
    - 引数が有ればその問題のディレクトリに入り、`main.py` を atcoder-tools でテストする
- `submit` で `check` と同じことをする（ただしテストが通ったら提出する）
- `ffsubmit` で `check` と同様のディレクトリの移動を行った後テストをせずにコードを提出する
- `db` でデバッガ(pdb)を起動し、`in_1.txt` を入力として実行させる

となります（例えば問題 D のコードをテストして提出するなら C++ 用の設定と同様に `submit D` を実行します）。

## カスタマイズ

↑のように、同じ名前（`check` や `submit` など）のコマンドを使用言語毎に作成して、config フォルダの中に `言語.sh` という名前で置きます。ファイルの新規作成・削除・内容の変更など（例えば `config/cpp.sh` の削除や `config/python.sh` の編集、`config/rust.sh` の作成など）は自由に行ってください。

## 使用言語の切り替え

使用言語を切り替えるには

```sh
$ use cpp
$ use python
```

など、`use` に続けて設定ファイル名を与えて実行します。

# アンインストール

`~/.bashrc` または `~/.zshrc` から

```sh
source /home/yourname/.cpconfig
```

の記述を削除し、ファイル `~/.cpconfig` および `~/.cplanguage` を削除し、clone したこのリポジトリを削除し、シェルを再起動します。
