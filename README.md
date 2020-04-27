# What is this

This is a repository for the ebuilds that I wrote and attempt to maintain.

# Contents

## `net-im/teams-for-linux`

[Microsoft Teams for Linux](https://github.com/IsmaelMartinez/teams-for-linux), Electron-based client for Teams. This is based on the binary precompiled releases of that repository. As additional features — ebuild handles icon installations and .desktop files generation. As an additional feature, simple firejail profile is added which can be enabled by a separate useflag.

## `media-gfx/scrnsht_ctl`

A simple screenshot ctl wrapper([source](https://gist.github.com/SabbathHex/87940496bd6bb9eec7f397bfe2ffe411)) around maim to be used with the i3/sway window managers. Allows making a screenshot of only the current monitor.

## `app-text/confluence_poster`

Supplementary script for writing confluence wiki articles in vim. Capable of alerting in case name of the last author is not the same one as in config so as to prevent collisions in versions.

## `app-misc/brightnessctl`

Script to adjust display/led brightness ([source repository](https://github.com/Hummer12007/brightnessctl)).

**Important note**: there are two USE flags in this ebuild in the 9999 version — `systemd` and `udev`. If systemd is enabled — resulting binary is installed with suid, regardless of whether `udev` is enabled.

## `x11-misc/monitors-switch`

Small set of utilities that automatically sets the screens positions based on WiFi network the machine is currently connected to. See the [separate repo](https://github.com/SabbathHex/monitors-switch) for more details.

## `x11-misc/root-notify-send`

A small utility that allows sending desktop notifications to the currently logged in user from root user. Uses `savedconfig` configuration for setting the user and their user ID, see `files` directory inside the ebuild folder.

## `x11-misc/dmenu2`

Fork of original dmenu with many patches applied and additional functionality. ([source repository](https://bitbucket.org/melek/dmenu2/src/default/))

This version is additionally patched to conform with [Gentoo directory structure](https://devmanual.gentoo.org/general-concepts/filesystem/index.html).

## `app-misc/tg-notify`

A script that alerts user via Telegram using curl. Based on [this](https://gist.github.com/SabbathHex/bb2725beb6f321c4c065055deca8bacd) gist.

## `app-misc/ckb-next-void`

Patched version of [ckb-next](https://github.com/ckb-next/ckb-next) that works with Corsair wireless device `1b1c:0a14`. Includes useflags related to GUI and animations, but they are untested.
