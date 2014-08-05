# -*-shell-script-*-
ZSH=$HOME/.oh-my-zsh

ZSH_THEME=schasse
COMPLETION_WAITING_DOTS=true

plugins=(rails git rvm pj tmuxinator autoenv hub)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

export PATH=$HOME/.rvm/bin:/usr/local/heroku/bin:$HOME/code/living-in-a-box/bin:$PATH
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export TERM=xterm-256color
export PROJECT_PATHS=$HOME/code
export EDITOR="emacsclient --alternate-editor=''"

# aliases
alias p='pj '

alias gca='git commit -a'
alias gcan='git commit -an'
alias gsp='g stash && ggpull && g stash pop'
alias grsp='g reset HEAD~1 && gsp'
alias ga='git add --all'
alias ggpushn='ggpush --no-verify'
alias be='bundle exec '
alias cpc='cap production rails:console'
alias csc='cap staging rails:console'
alias csd='cap staging deploy'
alias sd='script/staging_deploy'
alias rt='rspec -f documentation'
alias zt='zeus test'
alias ztm='zeus test spec/models'
alias zc='zeus console'
alias cdg='p gapfish'
alias cdb='p boostify'
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

alias e="emacsclient --tty --alternate-editor=''"
alias ec='emacsclient --create-frame &'
alias eq='emacs -nw -q'
# alias vim="emacsclient --tty --alternate-editor=''"
# alias vi="emacsclient --tty --alternate-editor=''"
alias ekill="emacsclient -e '(kill-emacs)'"

alias ai='sudo apt-get install'
alias au='sudo apt-get update'
alias acs='apt-cache search'
alias ds='dpkg -l | grep '

alias dsh="SYNC_DOTFILES=1 DOTFILES='.zsh .zshrc .gitconfig .rspec .pry_history .oh-my-zsh .oh-my-zsh/custom/schasse.zsh-theme' dev shell"
alias cds='cdg && dsh'
