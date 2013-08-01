ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(rails3 git rvm pj)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # rvm is a function!
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
export MAILGUN_API_KEY="somepassword"
export TERM=xterm-256color
export PROJECT_PATHS=~/workspace

# aliases
alias gcan='git commit -an'
alias cpc='cap production rails:console'
alias csc='cap staging rails:console'
alias rt='rspec -f documentation'
alias zt='zeus test -f documentation'
alias ztm='zeus test -f documentation spec/models'
alias zc='zeus console'
alias cdg='cd && cd workspace/gapfish'
alias cdb='cd && cd workspace/boostify'

alias sudo='sudo '

alias m2e='mvn eclipse:clean eclipse:eclipse -DdownloadJavadocs=true -DdownloadSources=true'
alias m2i='mvn clean install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true'
alias m2l='mvn eclipse:clean eclipse:eclipse clean package -DdownloadJavadocs=true -DdownloadSources=true -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -Pedu'
alias m2p='mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true'
alias m2t='mvn test'
alias m2a='mvn assembly:single'

alias e='emacsclient -t'
alias ec='emacsclient -c &'
alias vim='emacsclient -t'
alias vi='emacsclient -t'
