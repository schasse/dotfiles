# Path to your oh-my-zsh configuration and update...
ZSH=$HOME/.oh-my-zsh

# theme (~/.oh-my-zsh/themes/)
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# options
source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# aliases
alias sudo='sudo '
alias ..='cd ..'
alias ...='cd ../..'
alias m2e='mvn eclipse:clean eclipse:eclipse -DdownloadJavadocs=true -DdownloadSources=true'
alias m2i='mvn clean install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true'
alias m2l='mvn eclipse:clean eclipse:eclipse clean package -DdownloadJavadocs=true -DdownloadSources=true -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -Pedu'
alias m2p='mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true'
alias m2t='mvn test'
alias m2a='mvn assembly:single'
alias pry='pry -I .'
alias e='emacsclient -t'
alias ec='emacsclient -c &'
alias vim='emacsclient -t'
alias vi='emacsclient -t'

# plugins
plugins=(git mvn svn)

# exports
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/bin:/usr/games:/usr/local/games
export TERM=xterm-256color
export ALTERNATE_EDITOR=""

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# [[ $TERM == eterm-color ]] && export TERM=xterm
