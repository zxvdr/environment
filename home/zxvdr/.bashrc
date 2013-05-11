# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PS1='[\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
export INPUTRC=~/.inputrc
export TERMINAL="gnome-terminal"
export EDITOR="/usr/bin/vim"
export HISTCONTROL="ignoreboth"
export HISTSIZE="10000"

export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.3.x86_64/jre/"

export GOROOT=$HOME/go
export GOPATH="/home/zxvdr/src/go/"
export PATH=$PATH:$GOROOT/bin
