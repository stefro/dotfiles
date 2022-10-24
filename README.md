# .dotfiles for macOS

## What is this?

This repository services as a way to help setup and maintain my Mac. Consider this repository a fork of [Dries Vints](https://github.com/driesvints/dotfiles) dotfiles. For full instructions on a fresh macOS setup, follow the directions on Dries' repo.

**This version is expecting a Mac with Apple Silicon chipset.**

## Steps to Setup your Mac

These instructions are for when you've already set up your dotfiles.

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you export the Raycast config?
- Did you copy all the projects from the `project` folder?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Setting up your Mac

1. Update macOS to the latest version with the App Store
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/stefro/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone git@github.com:stefro/dotfiles.git ~/.dotfiles
   ```

4. `cd` into the `.dotfiles` dir and run the installation with:

   ```zsh
   ./fresh.sh
   ```

5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

Your Mac is now ready to use!

# Thanks to...
- [Dries Vints](https://github.com/driesvints/dotfiles) for creating the base of the Dotfiles
- [Todd Smith Salter](https://github.com/ToddSmithSalter/dotfiles) for this checklist and readme.
