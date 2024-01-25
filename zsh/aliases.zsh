# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias flushdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias hiddenoff="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hiddenon="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias clr="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/projects"

# Laravel
alias art="php artisan"
alias ltail='tail -f -n 450 storage/logs/laravel*.log \
  | grep -i -E \
    "^\[\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2}\]|Next [\w\W]+?\:" \
    --color'
alias mfs="php artisan migrate:fresh --seed"
alias clearall="php artisan optimize:clear"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm ci"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# phpunit
alias phpunit="vendor/bin/phpunit"

# Git
alias gst="git status"
alias gb="git branch"
alias gco="git checkout"
alias ga='git add'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias diff="git diff"
alias force="git push --force"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit"
alias uncommit="git reset --soft HEAD~1"
nah () {
    git reset --hard
    git clean -df
    if [ -d ".git/rebase-apply" ] || [ -d ".git/rebase-merge" ]; then
        git rebase --abort
    fi
}

# cli tools
alias cat='bat'

alias pf="php-cs-fixer fix"

# composer
alias c='composer'
alias ci='composer install'
alias cr='composer require'
alias cci="composer install --ignore-platform-reqs"
alias cu='composer update'

# functions
arm() {
  arch -x86_64 $@
}

function opendb () {
   [ ! -f .env ] && { echo "No .env file found."; exit 1; }

   DB_CONNECTION=$(grep DB_CONNECTION .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_HOST=$(grep DB_HOST .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_PORT=$(grep DB_PORT .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_DATABASE=$(grep DB_DATABASE .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_USERNAME=$(grep DB_USERNAME .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_PASSWORD=$(grep DB_PASSWORD .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)

   DB_URL="${DB_CONNECTION}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"

   echo "Opening ${DB_URL}"
   open $DB_URL
}

function commit() {
   commitMessage="$*"

   git add .

   if [ "$commitMessage" = "" ]; then
      aicommits
      return
   fi
 
   eval "git commit -a -m '${commitMessage}'"
}

# Spotlight
alias fix-spotlight-globally="find ~ -type d -path './.*' -prune -o -path './vendor*' -prune -o -path '*node_modules/*' -prune -o -type d -name 'node_modules' -exec touch '{}/.metadata_never_index' \; -print"
