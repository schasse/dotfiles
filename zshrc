# -*-shell-script-*-
ZSH=$HOME/.oh-my-zsh

ZSH_THEME=schasse
COMPLETION_WAITING_DOTS=true

plugins=(rails git rvm pj tmuxinator heroku)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

export PATH=$HOME/.rvm/bin:/usr/local/heroku/bin:$PATH
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export TERM=xterm-256color
export PROJECT_PATHS=$HOME/workspace
export EDITOR="emacsclient -t -a ''"

# aliases
alias p='pj '

alias gca='git commit -a'
alias gcan='git commit -an'
alias be='bundle exec '
alias cpc='cap production rails:console'
alias csc='cap staging rails:console'
alias rt='rspec -f documentation'
alias zt='zeus test -f documentation'
alias ztm='zeus test -f documentation spec/models'
alias zc='zeus console'
alias cdg='cd && cd workspace/gapfish'
alias cdb='cd && cd workspace/boostify'
alias h='nocorrect heroku'

alias genctags='ctags-exuberant -f TAGS --extra=-f --languages=-javascript --exclude=.git --exclude=log -e -R . $(rvm gemdir)/gems/'

alias m2e='mvn eclipse:clean eclipse:eclipse -DdownloadJavadocs=true'\
  ' -DdownloadSources=true'
alias m2i='mvn clean install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true'
alias m2l='mvn eclipse:clean eclipse:eclipse clean package'\
  ' -DdownloadJavadocs=true -DdownloadSources=true -Dmaven.test.skip=true'\
  ' -Dmaven.javadoc.skip=true -Pedu'
alias m2p='mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true'
alias m2t='mvn test'
alias m2a='mvn assembly:single'

alias e="emacsclient -t -a ''"
alias ec='emacsclient -c &'
alias vim="emacsclient -t -a ''"
alias vi="emacsclient -t -a ''"
