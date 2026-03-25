# Dotfiles configuration

My configuration file

## Usage
>! Note
> Make sure to read the script first
> Should check, make some change before using
> I have not tested yet the fedora setup scrip

```bash
git clone https://github.com/ssnnee/.dotfiles.git
cd .dotfiles
./setup-fedora
```
And just follow the instructions.

For the neovim config, I have another repo for that:
```
https://github.com/Ssnnee/init.lua
```

### Extra
Add terre repos packages
```bash
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
```

Install packages from this repo
```bash
sudo dnf install belleve-invis-iosevka-fonts matugen
```
