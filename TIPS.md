# Useful tips for problem that I have encountered

## Booting frm a windows manager not working
Need a polkit agent to be running. I use `lxpolkit` for that. Just add it to the startup script

## Making an app a default app
Just need to use xdg-settings with desktop file name.
So to make zen browser (the flatpak version) for example  the default browser,
just run:

>[!NOTE]:
>Make sur to check the desktop file name in
>`/var/lib/flatpak/exports/share/applications/` or `/usr/share/applications`
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

## Installing guest tools for gnome boxes
Just need to install the spice tool in the guest os, and then restart the guest
Browse to `https://www.spice-space.org/download.html`

## Expo blue screen
Usally it's just related to network. On fedora the port are blocked by default,
so just need to open them:
```bash
sudo firewall-cmd --add-port=8081/tcp --permanent
sudo firewall-cmd --reload
```
Ubuntu uses ufw I believe, so you can just run:
```bash
sudo ufw allow 8081/tcp
```
## Convert aab file to apk
Need to install java and download the bundletool. Here :
`https://github.com/google/bundletool/releases`
Then just run the command:
```bash
sudo dnf install java-latest-openjdk
java -jar bundletool.jar build-apks --bundle=your_app.aab --output=your_app.apks --mode=universal
unzip your_app.apks -d output_folder
```

## Kde connect
Sometimes it does not show any devices. Need to open certain ports on the fire-
wall side
```bash
sudo firewall-cmd --permanent --add-service=kdeconnect
sudo firewall-cmd --reload
```

## How to get deps packages for a project
Basically often you want to compile/build a project, on your own but you don't
often have the deps packages needed to do so. If your using fedora, you
can just do :
```bash
dnf builddep <package_name>
```
