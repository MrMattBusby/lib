#!/bin/bash

function sudo_func_env {
  ldconfig
  updatedb
  ulimit -c
}

function func_env {
  ulimit -c
}

function sudo_func_yum {
  yum clean all
  yum install       \
  autoconf          \
  automake          \
  clang             \
  clang-devel       \
  cmake             \
  colordiff         \
  cscope            \
  ctags             \
  ddd               \
  diffstat          \
  diffuse           \
  doxygen           \
  gcc-c++           \
  gcc-gfortran      \
  gcc-gnat          \
  git               \
  gnuplot           \
  htop              \
  libgnat           \
  libgnat-devel     \
  libstdc++         \
  libstdc++-devel   \
  libxml2           \
  libxml2-devel     \
  libxml++          \
  libxml++-devel    \
  llvm              \
  llvm-libs         \
  meld              \
  ncurses           \
  ncurses-devel     \
  ncurses-libs      \
  pandoc            \
  pyflakes          \
  pypy              \
  pypy-libs         \
  python-argcomplete\
  python-argparse   \
  python-click      \
  python-devel      \
  python-enum       \
  python-flask      \
  python-pep8       \
  python-pip        \
  python-tools      \
  python-websockify \
  python-werkzeug   \
  python-xlrd       \
  subversion        \
  tree              \
  valgrind          \
  wireshark         \
  wireshark-gnome
  #python34          \
  #python34-devel    \
  #python34-libs     \
  #python-enum34     \
  yum update
}

function func_clone {
  pushd ~
  git clone https://github.com/MrMattBusby/bin-tools.git
  git clone https://github.com/MrMattBusby/runcoms.git
  git clone https://github.com/MrMattBusby/vim-config.git
  git clone https://github.com/MrMattBusby/lib.git
  git clone https://github.com/MrMattBusby/helpfiles.git
  popd
}

function func_link {
  pushd ~
  ln -s runcoms/.bash_aliases
  ln -s runcoms/.bash_custom
  ln -s runcoms/.gitconfig
  ln -s runcoms/.vimrm
  ln -s runcoms/.pythonrc.py
  ln -s vim-config .vim
  ln -s lib/git.sh
  popd
}

function func_python {
  pep install --upgrade autopep8
}

function sudo_clean {
  rm -f /tmp/* 2> /dev/null
  rm -rf /var/tmp/* 2> /dev/null
  rm -f /usr/local/bin/* 2> /dev/null
  rm -f /usr/local/lib/* 2> /dev/null
  rm -rf /usr/local/lib/pkgconfig/* 2> /dev/null
  rm -rf /usr/local/include/* 2> /dev/null
  rm -f /usr/local/share/info/* 2> /dev/null
}

function clean {
  rm -rf "$HOME"/.cache/*
  rm -rf "$HOME"/.mozilla/firefox/*.default/Cache
  rm -rf "$HOME"/bin
  rm -rf "$HOME"/script*
  rm -rf "$HOME"/Doc*/*
  rm -rf "$HOME"/Downloads/*
  rm -rf "$HOME"/.ssh*
  rm -rf "$HOME"/.subversion*
  rm -rf "$HOME"/.local/share/Trash/*

  sudo sh -c "$(declare -f sudo_clean) ; sudo_clean"
}

if [ "$#" -eq 1 ] ; then
  $1
else
  func_clone
  func_link
  func_env
  sudo sh -c "$(declare -f sudo_func_env) ; sudo_func_env"
  sudo sh -c "$(declare -f sudo_func_yum) ; sudo_func_yum"
  func_python
fi
