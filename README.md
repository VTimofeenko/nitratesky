# What is this

This is a repository for the ebuilds that I wrote and attempt to maintain.

# Contents

## `app-misc/brightnessctl`

Script to adjust display/led brightness ([source repository](https://github.com/Hummer12007/brightnessctl)).

**Important note**: there are two USE flags in this ebuild in the 9999 version — `systemd` and `udev`. If systemd is enabled — resulting binary is installed with suid, regardless of whether `udev` is enabled.

## `app-misc/ckb-next-void`

Patched version of [ckb-next](https://github.com/ckb-next/ckb-next) that works with Corsair wireless device `1b1c:0a14`. Includes useflags related to GUI and animations, but they are untested.

## `app-misc/headsetcontrol`

[HeadsetControl](https://github.com/Sapd/HeadsetControl), an application to control (LED, sidetone, battery reporting) various headsets.

## `app-misc/tg-notify`

A script that alerts user via Telegram using curl. Based on [this](https://gist.github.com/VTimofeenko/bb2725beb6f321c4c065055deca8bacd) gist.

## `app-office/todoman`

[Todoman](https://github.com/pimutils/todoman) is a simple standards based cli todo manager.

## [`app-text/confluence_poster`](https://github.com/VTimofeenko/confluence_poster)

Supplementary script for writing Confluence wiki articles in vim. Uses information from config.toml to post the article content to confluence.

## [`app-text/mimedown`](https://github.com/begriffs/mimedown)

Write email in markdown, and convert to multipart MIME that works impeccably in graphical and console mail clients.

## [`app-portage/portage-record-patch`](https://github.com/VTimofeenko/portage-record-patch)

Small utility that automates the steps from [Gentoo Wiki to create quick patches](https://wiki.gentoo.org/wiki/Patches). On the first run it will prompt to create a git repo in the WORKDIR of unpacked package. On subsequent runs it will record the changes to the unpacked package in `/etc/portage/patches/<category>/<package_name>/`

## `dev-python/atlassian-python-api`

Python API framework for Atlassian products (Jira, Confluence, etc). Dependency of confluence_poster

## `dev-python/typer`

Python CLI framework

## `dev-vcs/git-fuzzy`

[Git-fuzzy](https://github.com/bigH/git-fuzzy), git + fzf integration

## `media-gfx/scrnsht_ctl`

A simple screenshot ctl wrapper([source](https://gist.github.com/VTimofeenko/87940496bd6bb9eec7f397bfe2ffe411)) around maim to be used with the i3/sway window managers.

## `net-im/teams-for-linux`

[Microsoft Teams for Linux](https://github.com/IsmaelMartinez/teams-for-linux), Electron-based client for Teams. This is based on the binary precompiled releases of that repository. As additional features — ebuild handles icon installations and .desktop files generation. As an additional feature, simple firejail profile is added which can be enabled by a separate useflag.

## `x11-misc/monitors-switch`

Small set of utilities that automatically sets the screens positions based on WiFi network the machine is currently connected to. See the [separate repo](https://github.com/VTimofeenko/monitors-switch) for more details.

## [`x11-misc/root-notify-send`]()

A small utility that allows sending desktop notifications to the currently logged in users from root user. Has `dunstify` use flag which replaces `notify-send` with [`dunstify`](https://github.com/dunst-project/dunst).

## `x11-misc/SH-wm-scripts`

A collection of scripts to be used with tmux, i3 and i3blocks


