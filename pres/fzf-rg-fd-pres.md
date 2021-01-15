# Fzf, Rg, & Fd
Have you ever needed quickly search for things in the terminal such as:
- A file name.
- Your command-line history.
- Git branches.
- Man pages.
- SSH host entries.
- Pretty much anything on your computer actually.

Of course you have! This presentation is for you.

## What is fd?
Written in Rust. Similar to find, but faster.

```
zsh -ic "curl https://raw.githubusercontent.com/sharkdp/fd/master/README.md | nvim"
```

## What is rg?
Written in Rust. Search file content super fast. Similar to grep, but faster.

```
zsh -ic "curl https://raw.githubusercontent.com/BurntSushi/ripgrep/master/README.md | nvim"
```

## What is fzf?
A fuzzy finder. Similar to Apple Spotlight Search...

But this is for the terminal and much more more configurable.

Also similar to rofi/dmenu, both popular for tile-based window managers in Linux.

```
zsh -ic "curl https://raw.githubusercontent.com/junegunn/fzf/master/README.md | nvim"
```
