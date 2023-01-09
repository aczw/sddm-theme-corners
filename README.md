# corners

theme for [SDDM](https://github.com/sddm/sddm) that puts stuff on the corners of the screen. take a look!

![glacier preview](preview/glacier.png)
![hanako preview](preview/hanako.png)

wasn't really a fan of preexisting themes so I made my own. kinda inspired by [sddm-chinese-painting-theme](https://github.com/fralonra/sddm-chinese-painting-theme)

## dependencies

this theme does not require KDE Plasma, so also make sure you have Qt 5 installed!

- SDDM
- Qt Graphical Effects
- Qt SVG
- Qt Quick Controls 2

on Arch, simply run `pacman -Syu sddm qt5-graphicaleffects qt5-svg qt5-quickcontrols2`

## installation

### AUR

for Arch users, the theme is available from the AUR [here](https://aur.archlinux.org/packages/sddm-theme-corners-git). install it with your favorite AUR helper: `paru sddm-theme-corners-git`

### manually

on other distros, simply download/clone this repo, and copy the `corners/` folder to `/usr/share/sddm/themes/`.
```
git clone https://github.com/aczw/sddm-theme-corners.git
cd sddm-theme-corners
cp -r corners/ /usr/share/sddm/themes/
```

## configuration
if you haven't already, make sure to change the current theme that SDDM is using. on Arch, create a config file in `/etc/sddm.conf.d/` with the following contents:
```
[Theme]
Current=corners
```
check the [Arch Wiki](https://wiki.archlinux.org/title/SDDM#Configuration) for more info.

you will probably want to configure the theme before using it, as out of the box it uses [Atkinson Hyperlegible](https://fonts.google.com/specimen/Atkinson+Hyperlegible) as the display font, and assumes a screen DPI of 216 (basically, my setup :p).

edit the `theme.conf` file (located inside `corners/`) as you see fit. I tried to make most stuff customizable, but please lemme know if you want other options too. here's a short description of what each option does:
