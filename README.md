# What is this

This is a repository for the ebuilds that I wrote and attempt to maintain.

# Installation

You can use `eselect repository enable nitratesky` to add this repo.

Alternatively, you can add the following to your `/etc/portage/repos.conf`:


    [nitratesky]

    location = /var/db/repos/nitratesky
    sync-type = git
    sync-uri = https://github.com/VTimofeenko/nitratesky
    priority = 50
    auto-sync = yes
    sync-depth = 1
    clone-depth = 1
    # Optional, requires app-crypt/openpgp-keys-vtimofeenko key installed.
    # Note: eselect repository gets the overlay from a mirror with unsigned action commits
    # done by a bot, so this will not work.
    #sync-git-verify-commit-signature = yes
    #sync-openpgp-key-path = /usr/share/openpgp-keys/pubkey_id_vtimofeenko.asc

# Packages

## app-crypt/openpgp-keys-newsboat

**Versions available**:
20220920

Public key of Newsboat release


## app-crypt/openpgp-keys-vtimofeenko

**Versions available**:
20200204

Public key of Vladimir Timofeenko


## app-misc/bna

**Versions available**:
5.0.2, 9999

Remotes:

* **GitHub**: [link](https://github.com/jleclanche/python-bna).

	Release: [![GitHub release](https://img.shields.io/github/release/jleclanche/python-bna.svg)](https://GitHub.com/jleclanche/python-bna/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/bna/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/bna.svg)](https://pypi.python.org/pypi/bna/) [![PyPI version shields.io](https://img.shields.io/pypi/v/bna.svg)](https://pypi.python.org/pypi/bna/)

Command-line interface for managing Battle.net authenticator

bna is a command line interface to the python-bna library. It can store and manage multiple authenticators, as well as create new ones. Remember: Using an authenticator on the same device as the one you log in with is less secure than keeping the devices separate. Use this at your own risk.
## app-misc/brightnessctl

**Versions available**:
0.4, 9999

Remotes:

* **GitHub**: [link](https://github.com/Hummer12007/brightnessctl).

	Release: [![GitHub release](https://img.shields.io/github/release/Hummer12007/brightnessctl.svg)](https://GitHub.com/Hummer12007/brightnessctl/releases/)

This program allows you read and control device brightness.

This program allows you read and control device brightness. Devices, by default, include backlight and LEDs (searched for in corresponding classes). If omitted, the first found device is selected.
It can also preserve current brightness before applying the operation (allowing for usecases like disabling backlight on lid close).
## app-misc/ckb-next-void

**Versions available**:
0.1

Based on ckb-next, provides patched version for specific device


## app-misc/headsetcontrol

**Versions available**:
2.4, 2.6, 9999

Remotes:

* **GitHub**: [link](https://github.com/Sapd/HeadsetControl).

	Release: [![GitHub release](https://img.shields.io/github/release/Sapd/HeadsetControl.svg)](https://GitHub.com/Sapd/HeadsetControl/releases/)

Adds loopback and LED control to headsets

A tool to control certain aspects of USB-connected headsets on Linux. Currently, support is provided for adjusting sidetone, getting battery state, controlling LEDs, and setting the inactive time. See below for which headset supports which feature.
## app-misc/tg-notify

**Versions available**:
9999

A _very_ primitive telegram notification mechanism


## app-office/todoman

**Versions available**:
4.0.1

Remotes:

* **GitHub**: [link](https://github.com/pimutils/todoman).

	Release: [![GitHub release](https://img.shields.io/github/release/pimutils/todoman.svg)](https://GitHub.com/pimutils/todoman/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/todoman/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/todoman.svg)](https://pypi.python.org/pypi/todoman/) [![PyPI version shields.io](https://img.shields.io/pypi/v/todoman.svg)](https://pypi.python.org/pypi/todoman/)

Simple, standards-based, cli todo (aka: task) manager

Todoman is a simple, standards-based, cli todo (aka: task) manager. Todos are stored into icalendar files, which means you can sync them via CalDAV using, for example, vdirsyncer.
## app-portage/git-verify-signature

**Versions available**:
1.3

Remotes:

* **GitHub**: [link](https://github.com/VTimofeenko/git-verify-signature.eclass).

	Release: [![GitHub release](https://img.shields.io/github/release/VTimofeenko/git-verify-signature.eclass.svg)](https://GitHub.com/VTimofeenko/git-verify-signature.eclass/releases/)

Eclass that may be used to verify the signature on the top commit

This repo contains an eclass that may be used to verify the signature on the top commit of a repository checked out during git-r3 based ebuild installation.
git-verify-signature.eclass is based on and exposes the same variables
## app-portage/overlay-maintain-tools

**Versions available**:
1.3.1

Remotes:

* **GitHub**: [link](https://github.com/VTimofeenko/overlay-maintain-tools).

	Release: [![GitHub release](https://img.shields.io/github/release/VTimofeenko/overlay-maintain-tools.svg)](https://GitHub.com/VTimofeenko/overlay-maintain-tools/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/overlay-maintain-tools/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/overlay-maintain-tools.svg)](https://pypi.python.org/pypi/overlay-maintain-tools/) [![PyPI version shields.io](https://img.shields.io/pypi/v/overlay-maintain-tools.svg)](https://pypi.python.org/pypi/overlay-maintain-tools/)

Generates README and versions report for overlay

A set of utils to generate README for Gentoo overlays and look up available versions in remote overlays.
## app-portage/portage-record-patch

**Versions available**:
1.0.0, 1.1.0

Remotes:

* **GitHub**: [link](https://github.com/VTimofeenko/portage-record-patch).

	Release: [![GitHub release](https://img.shields.io/github/release/VTimofeenko/portage-record-patch.svg)](https://GitHub.com/VTimofeenko/portage-record-patch/releases/)

A small utility to write down user patches


## app-shells/zsh-async

**Versions available**:
1.8.5, 9999

Remotes:

* **GitHub**: [link](https://github.com/mafredri/zsh-async).

	Release: [![GitHub release](https://img.shields.io/github/release/mafredri/zsh-async.svg)](https://GitHub.com/mafredri/zsh-async/releases/)

Asynchronous jobs for ZSH

With zsh-async you can run multiple asynchronous jobs, enforce unique jobs (multiple instances of the same job will not run), flush all currently running jobs and create multiple workers (each with their own jobs). For each worker you can register a callback-function through which you will be notified about the job results (job name, return code, output and execution time).
## app-text/confluence_poster

**Versions available**:
1.4.4

Remotes:

* **GitHub**: [link](https://github.com/VTimofeenko/confluence_poster).

	Release: [![GitHub release](https://img.shields.io/github/release/VTimofeenko/confluence_poster.svg)](https://GitHub.com/VTimofeenko/confluence_poster/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/confluence_poster/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/confluence_poster.svg)](https://pypi.python.org/pypi/confluence_poster/) [![PyPI version shields.io](https://img.shields.io/pypi/v/confluence_poster.svg)](https://pypi.python.org/pypi/confluence_poster/)

Supplementary script for posting confluence wiki articles from vim.

Supplementary script for writing Confluence articles in local editor.
Uses information from the config to post the article content to Confluence.
## app-text/mimedown

**Versions available**:
9999

Remotes:

* **GitHub**: [link](https://github.com/begriffs/mimedown).

	Release: [![GitHub release](https://img.shields.io/github/release/begriffs/mimedown.svg)](https://GitHub.com/begriffs/mimedown/releases/)

Write email in markdown, and convert to multipart MIME


## dev-libs/libversion

**Versions available**:
3.0.1

Remotes:

* **GitHub**: [link](https://github.com/repology/libversion).

	Release: [![GitHub release](https://img.shields.io/github/release/repology/libversion.svg)](https://GitHub.com/repology/libversion/releases/)

Advanced version string comparison library

Need to compare software, package or whatever versions? Comparing 1.0 and 1.1 could be easy, but are you ready for more complex cases like 1.2-x.3~alpha4? libversion is, which is proven by using the library in Repology project which relies on comparing software version strings, even if they are written in different formats.
## dev-python/atlassian-python-api

**Versions available**:
3.11.0, 3.14.1

Remotes:

* **GitHub**: [link](https://github.com/atlassian-api/atlassian-python-api).

	Release: [![GitHub release](https://img.shields.io/github/release/atlassian-api/atlassian-python-api.svg)](https://GitHub.com/atlassian-api/atlassian-python-api/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/atlassian-python-api/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/atlassian-python-api.svg)](https://pypi.python.org/pypi/atlassian-python-api/) [![PyPI version shields.io](https://img.shields.io/pypi/v/atlassian-python-api.svg)](https://pypi.python.org/pypi/atlassian-python-api/)

Provides a simple python interface for interacting with Atlassian products


## dev-python/libversion

**Versions available**:
1.2.3, 1.2.4

Remotes:

* **GitHub**: [link](https://github.com/repology/py-libversion).

	Release: [![GitHub release](https://img.shields.io/github/release/repology/py-libversion.svg)](https://GitHub.com/repology/py-libversion/releases/)

Python bindings for libversion

Python bindings for libversion, which provides fast, powerful and correct generic version string comparison algorithm.
## dev-python/pynvim

**Versions available**:
0.4.3

Remotes:

* **GitHub**: [link](https://github.com/neovim/pynvim).

	Release: [![GitHub release](https://img.shields.io/github/release/neovim/pynvim.svg)](https://GitHub.com/neovim/pynvim/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/pynvim/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/pynvim.svg)](https://pypi.python.org/pypi/pynvim/) [![PyPI version shields.io](https://img.shields.io/pypi/v/pynvim.svg)](https://pypi.python.org/pypi/pynvim/)

Python client for Neovim

Pynvim implements support for python plugins in Nvim. It also works as a library for connecting to and scripting Nvim processes through its msgpack-rpc API.
Compared to the Gentoo repo this ebuild has RDEPEND in addition to DEPEND. I am testing its interaction with binpkgs before submitting a pull request.
## dev-python/typer

**Versions available**:
0.3.2, 0.4.0

Remotes:

* **GitHub**: [link](https://github.com/tiangolo/typer).

	Release: [![GitHub release](https://img.shields.io/github/release/tiangolo/typer.svg)](https://GitHub.com/tiangolo/typer/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/typer/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/typer.svg)](https://pypi.python.org/pypi/typer/) [![PyPI version shields.io](https://img.shields.io/pypi/v/typer.svg)](https://pypi.python.org/pypi/typer/)

Typer, build great CLIs. Easy to code. Based on Python type hints.


## dev-python/xdg

**Versions available**:
5.0.1

Provides functions to return paths defined by XDG Base Directory Specification


## dev-vcs/git-fuzzy

**Versions available**:
9999

Remotes:

* **GitHub**: [link](https://github.com/bigH/git-fuzzy).

	Release: [![GitHub release](https://img.shields.io/github/release/bigH/git-fuzzy.svg)](https://GitHub.com/bigH/git-fuzzy/releases/)

A CLI interface to git that relies heavily on fzf


## media-gfx/scrnsht_ctl

**Versions available**:
9999

A small ctl wrapper around main to be used in conjunction with i3/sway.


## media-gfx/ueberzug

**Versions available**:
18.1.9, 9999

Remotes:

* **GitHub**: [link](https://github.com/seebye/ueberzug).

	Release: [![GitHub release](https://img.shields.io/github/release/seebye/ueberzug.svg)](https://GitHub.com/seebye/ueberzug/releases/)
* **PyPI**: [link](https://pypi.python.org/pypi/ueberzug/).

	Version: [![PyPI version fury.io](https://badge.fury.io/py/ueberzug.svg)](https://pypi.python.org/pypi/ueberzug/) [![PyPI version shields.io](https://img.shields.io/pypi/v/ueberzug.svg)](https://pypi.python.org/pypi/ueberzug/)

Utility which allows to draw images on terminals by using child windows

Überzug is a command line util which allows to draw images on terminals by using child windows.
## media-sound/ncspot

**Versions available**:
0.7.3, 0.8.2, 0.9.0, 0.9.2

Remotes:

* **GitHub**: [link](https://github.com/hrkfdn/ncspot).

	Release: [![GitHub release](https://img.shields.io/github/release/hrkfdn/ncspot.svg)](https://GitHub.com/hrkfdn/ncspot/releases/)

ncurses Spotify client written in Rust

ncurses Spotify client written in Rust using librespot. It is heavily inspired by ncurses MPD clients, such as ncmpc. The author's motivation was to provide a simple and resource friendly alternative to the official client as well as to support platforms that currently don't have a Spotify client, such as the *BSDs.
*Maintainer note*: cover feature not yet supported.
## net-im/teams-for-linux

**Versions available**:
0.7.0, 1.0.0, 1.0.25

Remotes:

* **GitHub**: [link](https://github.com/IsmaelMartinez/teams-for-linux).

	Release: [![GitHub release](https://img.shields.io/github/release/IsmaelMartinez/teams-for-linux.svg)](https://GitHub.com/IsmaelMartinez/teams-for-linux/releases/)

Microsoft Teams client for Linux. Binary precompiled version.


## net-misc/ytfzf

**Versions available**:
1.1.4, 1.1.5, 1.1.6, 1.2.0, 99999999

Remotes:

* **GitHub**: [link](https://github.com/pystardust/ytfzf).

	Release: [![GitHub release](https://img.shields.io/github/release/pystardust/ytfzf.svg)](https://GitHub.com/pystardust/ytfzf/releases/)

A posix script that helps you find Youtube videos and opens using mpv/youtube-dl

Maintainer note: there are no releases upstream. The pinned date is for convenience and to separate truly live release from a pinned version. Supports:
* Thumbnails
* History support
* Download support
* Format selection (and default formats)
* Queue multiple tracks (using fzf multiselection)
## net-news/newsboat

**Versions available**:
2.24, 2.25

Remotes:

* **GitHub**: [link](https://github.com/newsboat/newsboat).

	Release: [![GitHub release](https://img.shields.io/github/release/newsboat/newsboat.svg)](https://GitHub.com/newsboat/newsboat/releases/)

An RSS/Atom feed reader for text terminals

Newsboat is an RSS/Atom feedreader. RSS and Atom are a number of widely-used XML formats to transmit, publish and syndicate articles, for example news or blog articles. Newsboat is designed to be used on text terminals on Unix or Unix-like systems such as GNU/Linux, FreeBSD or macOS.
This version of newsboat package also verifies the release signature.
## net-vpn/wireguard-namespace-service

**Versions available**:
0.1.1, 9999

Remotes:

* **GitHub**: [link](https://github.com/VTimofeenko/wireguard-namespace-service).

	Release: [![GitHub release](https://img.shields.io/github/release/VTimofeenko/wireguard-namespace-service.svg)](https://GitHub.com/VTimofeenko/wireguard-namespace-service/releases/)

A script and a service to bring up isolated namespace for WireGuard


## sys-kernel/dracut-pcscd-cryptsetup

**Versions available**:
9999

Remotes:

* **GitHub**: [link](https://github.com/VTimofeenko/dracut-pcscd-cryptsetup).

	Release: [![GitHub release](https://img.shields.io/github/release/VTimofeenko/dracut-pcscd-cryptsetup.svg)](https://GitHub.com/VTimofeenko/dracut-pcscd-cryptsetup/releases/)

A dracut module that installs pcscd daemon into initramfs


## www-apps/hugo

**Versions available**:
0.85.0, 0.86.1, 0.87.0

Remotes:

* **GitHub**: [link](https://github.com/gohugoio/hugo).

	Release: [![GitHub release](https://img.shields.io/github/release/gohugoio/hugo.svg)](https://GitHub.com/gohugoio/hugo/releases/)

The world's fastest framework for building websites

Hugo is a static HTML and CSS website generator written in Go. It is optimized for speed, ease of use, and configurability.
## x11-libs/libXft-bgra-patch

**Versions available**:
2.3.3, 2.3.4

BGRA patch for libXft

This is a patch file for enabling BGRA glyphs (emojis) support in libXft. Installs as a single patch file into /etc/portage/. The patch file was taken from https://gitlab.freedesktop.org/xorg/lib/libxft/-/merge_requests/1
## x11-misc/SH-wm-scripts

**Versions available**:
9999

This is a collection of scripts to be used with tmux, i3-gaps and i3blocks.


## x11-misc/monitors-switch

**Versions available**:
9999

A basic script to switch monitors when connected to specific network


## x11-misc/root-notify-send

**Versions available**:
1.1.0, 9999

Remotes:

* **GitHub**: [link](https://github.com/VTimofeenko/root-notify-send).

	Release: [![GitHub release](https://img.shields.io/github/release/VTimofeenko/root-notify-send.svg)](https://GitHub.com/VTimofeenko/root-notify-send/releases/)

Allows calling notify-send as root for it to appear on a user's desktop



