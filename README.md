# Nvim config setup

This config is inspired by [this video](https://www.youtube.com/watch?v=6pAG3BHurdM&ab_channel=JoseanMartinez)

There are some dependencies for installing all the plugins, mainly package manager:

- npm
- cargo

Make sure these are installed.

## Setup config

```
cd ~/.config
git clone git@github.com:RobinHeitz/nvim-conf.git nvim

```

Or clone it somewhere else & create a link:

```
ln -s ~/path/to/my/nvim-setup ~/.config/nvim
```

## Install Neovim

### Mac

Install nvim, fonts & tools

```
brew install neovim

brew tap homebrew/cask-fonts

brew install font-meslo-lg-nerd-font

brew install ripgrep

brew install jesseduffield/lazygit/lazygit

```

### Ubuntu

Go to destination of nvim:

```
cd ~/Applications
```

Download

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
```

Extract:

```
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
mv squashfs-root nvim_app
```

Link nvim globally

```
sudo ln -s ~/Applications/nvim_app/AppRun /usr/bin/nvim
rm nvim.appimage
```

ALTERNATIVE b/c of error with multiple parsers attatching:
:echo nvim_get_runtime_file('parser', v:true)

Install therefore with tar.gz, extract, move to /opt
Then: 
```
ln -s /opt/nvim-linuxxxx/bin/nvim ~/.local/bin

```
