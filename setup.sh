#!/bin/bash
NEOVIM_VERSION="v0.11.5"

function npmInstall() {
    if [ $(npm list -g | grep $1 | wc -l) -ne 1 ]; then
        npm install -g $1
    fi
}

###################################################
#
#           apt用インストールスクリプト
#
###################################################
function apt_installer() {
    # neovimインストール
    nvim --version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "neovimをインストールします..."
        sudo apt-get update
        sudo apt-get install -y cmake git build-essential
        git clone https://github.com/neovim/neovim.git
        cd neovim
        git checkout ${NEOVIM_VERSION}
        sudo make CMAKE_BUILD_TYPE=Release
        sudo make install
        cd ..
        rm neovim -rf
    fi

    # pythonインストール
    python3 --version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "python3をインストールします..."
        sudo apt-get update
        sudo apt-get install software-properties-common -y
        sudo add-apt-repository ppa:deadsnakes/ppa
        sudo apt-get update
        sudo apt-get install -y python3.13 python3.13-venv
    fi

    # golangインストール
    go version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "golangをインストールします..."
        sudo apt-get update
        sudo apt-get upgrade -y
        sudo apt-get install -y golang-go
    fi

    # nodeインストール
    node --version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "nodeをインストールします..."
        sudo apt-get update
        sudo apt-get install -y ca-certificates curl gnupg
        curl -fsSL deb.nodesource.com | sudo -E bash -
        sudo apt-get install -y nodejs
    fi

    # java21インストール
    java --version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "javaをインストールします..."
        sudo apt-get update
        sudo apt-get install openjdk-21-jdk -y
    fi

    # その他必要なツールのインストール
    # ripgrep
    rg --version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "ripgrepをインストールします..."
        sudo apt-get update
        sudo apt-get install ripgrep -y
    fi

    # lazygit
    lazygit --version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "LazyGitをインストールします..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit -D -t /usr/local/bin/
        rm -rf lazygit
        rm -rf lazygit.tar.gz
    fi

    # LSPインストール
    npmInstall "pyright"
    npmInstall "bash-language-server"
    npmInstall "vscode-langservers-extracted"
    npmInstall "typescript"
    npmInstall "typescript-language-server"
    if [ ! -d $HOME/.config/nvim/lsp/java ]; then
        CUR_DIR=$(pwd)
        mkdir -p $HOME/.config/nvim/lsp/java
	cd $HOME/.config/nvim/lsp/java
	wget https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
	tar -xzvf jdt-language-server-latest.tar.gz
	jar_path=$(ls ~/.config/nvim/lsp/java/plugins/org.eclipse.equinox.launcher_*)
	if [ $(echo ${jar_path} | wc -l) -eq 1 ]; then
	    echo "JDTLS_JAR=${jar_path}" >> ~/.bashrc
	fi
	wget https://projectlombok.org/downloads/lombok.jar
	rm jdt-language-server-latest.tar.gz
	cd $CUR_DIR
    fi

    # deinインストール
    if [ ! -d $HOME/.config/nvim/dein.vim ]; then
	git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/dein.vim
    fi

    # 設定ファイルインストール
    if [ ! -d $HOME/.config/nvim ]; then
	mkdir -p $HOME/.config/nvim
    fi
    cp nvim/* ~/.config/nvim/ -rf

}

if command -v apt > /dev/null 2>&1; then
    apt_installer
elif command -v dnf > /dev/null 2>&1; then
    dnf_installer
elif command -v yum > /dev/null 2>&1; then
    yum_installer
else
    echo "Unsupported package manager"
    exit 1
fi


