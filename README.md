# Gentoo Overlay
## Introduction
A gentoo overlay for myself.
- When I find some outdated ebuilds with invalid URL or other parameters, I will patch them and add it to my overlay.
- When I want to use some pacakges not in official overlay, usually I will search for an ebuild written by someone. Because I do not want to add lots of personal overlay, I will move the ebuild into my overlay.

Moreover, I move my local overlay to Github, only because I have several Gentoo computers.

## Installation
Suppose you already have `layman` installed, then run

`layman -o https://raw.githubusercontent.com/lhttjdr/gentoo-overlay/master/repositories.xml -f -a lhttjdr-overlay`

to add a overlay called `lhttjdr-overlay`.
