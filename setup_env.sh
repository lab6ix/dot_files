#!/bin/bash

# install softwares

# check for homebrew
if [ ! -d "/usr/local/Homebrew" ]; then
    echo "no homebrew directory found installing it"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# check for xz
if [ ! -f "/usr/local/bin/xz" ]; then
    echo "no xz found installing it"
    /usr/local/bin/brew install xz
fi

# check for openssl
if [ ! -d "/usr/local/opt/openssl" ]; then
    echo "no openssl found installing it"
    /usr/local/bin/brew install openssl
fi

# check for zlib
if [ ! -d "/usr/local/opt/zlib" ]; then
    echo "no zlib found installing it"
    /usr/local/bin/brew install zlib
fi

# check for ruby
if [ ! -f "/usr/local/bin/ruby" ]; then
    echo "no ruby found installing it"
    /usr/local/bin/brew install ruby
fi

#check for basepath
if [ ! -d "/opt" ]; then
    echo "no basepath found creating it"
    sudo mkdir -p /opt/
    sudo chown -R ${USER}:staff /opt
fi

# check for zsh
if [ ! -f "/usr/local/bin/zsh" ]; then
    echo "no zsh found installing it"
    /usr/local/bin/brew install zsh
fi

# check for oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    echo "no oh-my-zsh found installing it"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

# check for pythons
if [ ! -d "/opt/py_3.6.3" ]; then
    echo "no python 3 found"
    curl -O https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
    tar xzf Python-3.6.3.tgz
    cd Python-3.6.3
    CPPFLAGS="-I/usr/local/opt/openssl/include" LDFLAGS="-L/usr/local/opt/openssl/lib" ./configure --prefix=/opt/py_3.6.3 --with-pydebug --with-dtrace --enable-loadable-sqlite-extensions --enable-big-digits --with-doc-strings --with-pymalloc
    make
    sudo make install
    cd ..
    cd ${WORKSPACE}
fi

if [ ! -d "/opt/py_2.7.14" ]; then
    echo "no python 2 found"
    curl -O https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
    tar xzf Python-2.7.14.tgz
    cd Python-2.7.14
    CPPFLAGS="-I/usr/local/opt/openssl/include" LDFLAGS="-L/usr/local/opt/openssl/lib" ./configure --prefix=/opt/py_2.7.14 --with-pydebug --with-dtrace --enable-loadable-sqlite-extensions --enable-big-digits --with-doc-strings --with-pymalloc
    make
    sudo make install
    /opt/py_2.7.14/bin/python -m ensurepip
    cd ..
    cd ${WORKSPACE}
fi


# move the dots in place
cp -a zsh/zshrc ${HOME}/.zshrc
cp -a git/gitconfig ${HOME}/.gitconfig
cp -a git/gitignore ${HOME}/.gitignore
cp -a emacs/emacs.d ${HOME}/.emacs.d
cp -a bins/ec /usr/local/bin/ec



# 
