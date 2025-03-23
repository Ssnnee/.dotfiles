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
