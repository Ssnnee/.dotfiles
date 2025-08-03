# Useful tips for problem that I have encountered

## Booting frm a windows manager not working
Need a polkit agent to be running. I use `lxpolkit` for that. Just add it to the startup script

## Making an app a default app
Just need to use xdg-settings with desktop file name.
So to make zen browser (the flatpak version) for example  the default browser,
just run:

>[!NOTE]:
>Make sur to check the desktop file name in `/var/lib/flatpak/exports/share/applications/`
```bash
xdg-settings set default-web-browser app.zen_browser.zen.desktop
```
## MTP to work
Just need to install android-file-transfer

## Removing a protected package by force in fedora
```bash
sudo rpm -e --nodeps  <package_name>
```

## To build st
After clonig luke smith repo, need to remplace CC=c99 by CC=cc
- On opensuse here the package that have to be added
```
libXft-devel
```


## To generate an ssh key for github
```bash
ssh-keygen -t ed25519 -C "mail"
```
## To setup pass
```bash
gpg --full-gen-key
```
Then follow the instructions, and then run:
```bash
pass init "Your Name"
```
For pass otp, you need to install it and zbarimg or zbar depending on your distro.

## To change languages
To do this, need to see the list first `locale -a`
then for example
```bash
localectl set-locale LANG=en_GB.utf8
```
The computer have to be restart so that it can take effect
You can also just change the `$LANG` value by `LANG=...` you might also just
export it `export LANG=...`

