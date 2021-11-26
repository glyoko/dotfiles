. $HOME/.bashrc


# aliases, useful functions
alias ll="ls -la"
alias f="fuck"
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
function if_good {
  if ((! $?)) ; then eval "$@" ; fi
}


# ruby/rails
alias b="bundle"
alias be="bundle exec"
alias rdm="rake db:migrate"
alias rdr="rake db:rollback"
alias rddc="rake db:drop db:create"
alias rddcs="rake db:drop db:create db:structure:load"
alias rddcsm="rake db:drop db:create db:structure:load db:migrate"
function rspec_changed() {
  local changed_specs=$(git df ${1:-beta} --name-only spec/*_spec.rb);
  rspec $changed_specs;
}


# docker aliases
alias dj=docker_jump
alias dcr="docker-compose down && docker-compose up -d"
function killdock {
	docker rm -f $(docker ps -aq)
}

function docker_jump {
	docker exec -i -t $1 /bin/sh
}


# ffmpeg shortucts
function m3u8 {
    ffmpeg -i $1 -c copy -bsf:a aac_adtstoasc $2
}


# rvm
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/opt/srm/bin:$PATH"


# # bash-completion
# # [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion # This line outputted from brew install.
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi


# git-bash-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
export GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ \[\033[0;37m\]$(date +%H:%M)\[\033[0;0m\] \[\033[0;33m\]\w\[\033[0;0m\]"
export GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_ \[\033[0;37m\]$(date +%H:%M)\[\033[0;0m\] \[\033[0;33m\]\w\[\033[0;0m\]"
export GIT_PROMPT_END_USER=" $ "
export GIT_PROMPT_END_ROOT=" # "

# GIT_PROMPT_ONLY_IN_REPO=1 # I prefer having git-bash style prompt everywhere


# personal aws stuff (DEPRECATED, KEEPING ONLY FOR REFERENCE)
export AWS_DEFAULT_PROFILE=glyoko
alias glyoko="ssh ec2-user@ec2-52-88-209-60.us-west-2.compute.amazonaws.com"


# jenv
export PATH="$HOME/.jenv/bin:$PATH"
[[ -s "$HOME/.jenv/bin" ]] && eval "$(jenv init -)"


# elixir stuff
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"


# direnv setup
eval "$(direnv hook bash)"


# npm bs
export PATH="/usr/local/opt/node@10/bin:$PATH"


# go setup
export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOPATH/bin:$PATH"

# helpful tool for finding biggest files in a directory
# requires `brew install findutils`
function find-biggest() {
  gfind $1 -type f -printf '%s %p\n' | sort -nr | head -10
}

# record all bash history
export HISTSIZE=1000000


# where I keep any custom bins
export PATH="~/.bin/:$PATH"


# GPG stuff
export GPG_TTY=$(tty)
