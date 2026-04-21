# How everything works

```mermaid
flowchart TD;
    0(START)-->1[tuigreet];
	1--startx-->2[.xinitrc];
	2--bspc-->3[.bspwmrc];
	3-->4[feh];
	4---feh_desc([ sets background ])
	3-->5[polybar];
	5---poly_desc([ sets up bar ])
	3-->6[picom];
	6---picom_desc(["compositor (specifically the ibhagwan fork)"])
	3-->7[sxhkd];
	7---sxhkd_desc([ sets hotkeys ])
	3-->8[redshift];
	8---redshift_desc([ controls color temperature ])
	click 1 href "https://github.com/apognu/tuigreet" _blank
	click 2 href "https://wiki.archlinux.org/title/xinit" _blank
	click 3 href "https://wiki.archlinux.org/title/Bspwm" _blank
	click 4 href "https://wiki.archlinux.org/title/Feh" _blank
	click 5 href "https://github.com/polybar/polybar" _blank
	click 6 href "https://github.com/ibhagwan/picom" _blank
	click 7 href "https://wiki.archlinux.org/title/Sxhkd" _blank
	click 8 href "https://wiki.archlinux.org/title/Redshift" _blank
```

```mermaid
flowchart TD;
	T(Tools)---term(Terminal)
	term---kitty
	T---launcher(Launcher)
	launcher---rofi
	T---editor(Editor)
	editor---neovim
	click kitty href "https://sw.kovidgoyal.net/kitty/" _blank
	click rofi href "https://github.com/davatorium/rofi" _blank
	click neovim href "https://neovim.io/" _blank
```

## Description

-   Theme:
    -   [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin#-design-philosophy)
-   Background:
    -   [Cat Waves](https://github.com/catppuccin/wallpapers/blob/main/waves/cat-waves.png)
