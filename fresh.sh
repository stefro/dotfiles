#!/bin/sh

# Ask for the administrator password upfront
sudo -v

echo "Setting up your Mac..."

# install rosetta
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Set default PostgeSQL user and password; And user Marketsquare for local dev
psql postgres -U stef -c "CREATE ROLE postgres SUPERUSER; ALTER ROLE postgres WITH LOGIN; ALTER ROLE postgres WITH CREATEROLE; ALTER ROLE postgres WITH CREATEDB;
CREATE ROLE marketsquare SUPERUSER; ALTER ROLE marketsquare WITH LOGIN; ALTER ROLE marketsquare WITH CREATEROLE; ALTER ROLE marketsquare WITH CREATEDB;"

# Install PHP extensions with PECL
pecl install imagick memcached redis swoole

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink global gitignore
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

