# Path to your oh-my-zsh installation.
export ZSH=/Users/maryrosecook/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=13

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="+"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function get_pwd() {
    echo "${PWD/$HOME/~}"
}

function put_spacing() {

}

function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " $fg[yellow]$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='$fg[blue]$(get_pwd)$(put_spacing)$(git_prompt_info) $fg[red]> $reset_color'

# include bash file for private stuff (not checked in anywhere)
if [ -f ~/.bash_private ]; then
    . ~/.bash_private
fi

############# handy functions

# start quick python server and open webpage, passing optional port
function serve() {
    if [ $# -ne 1 ]; then
        let port=4000+0
    else
        let port=$@
    fi

    python -m SimpleHTTPServer "$port";
}

# do interactive git rebase at passed revision index
function gr() {
    let revisionIndex=$@
    git rebase -i HEAD~$revisionIndex;
}

PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# terminal colours
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export TERM=xterm-256color

# set editor to emacs
export EDITOR=emacs

# use stuff in brew path over stuff in usr/bin
PATH=/usr/local/bin:$PATH

# add ~/bin to path
export PATH=$HOME/bin:$PATH

# v8 for clojurescript tests
export V8_HOME=$HOME/code/v8/out/x64.release

# aliases
alias ls='ls -l'
alias gs='git status'
alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white)"'
alias gc='git cat-file -p'
alias lr='lein repl'
alias rl='rlwrap'
alias live='live-server . --port=4000 --no-browser --host=localhost'
alias e='emacsclient -n'

# add lein to path
export PATH=$HOME/local/bin:$PATH

# clojurescript
export CLOJURESCRIPT_HOME=$HOME/code/clojurescript
export PATH=$CLOJURESCRIPT_HOME/bin:$PATH # add to path

# add clojure to classpath
export CLASSPATH="$CLASSPATH:$HOME/.lein/self-installs/leiningen-VERSION-standalone.jar"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
