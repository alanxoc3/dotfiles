# dotfiles
alanxoc3's dotfiles. feel free to plagiarize. the following is software i use or recommend...

## commandline
- [age](https://gnupg.org/). A simple cli tool/protocol to encrypt files. Way simpler than gpg.
- [amfora](https://github.com/makeworld-the-better-one/amfora). CLI based gemini client.
- [concards](https://github.com/alanxoc3/concards). Use this to review flashcards.
- [eza](https://github.com/eza-community/eza). A modern implementation of ls.
- [fd](https://github.com/sharkdp/fd). Search file names super fast. Faster and cooler than find.
- [feh](https://feh.finalrewind.org/). Simple image viewer.
- [fzf](https://github.com/junegunn/fzf). Fuzzy find for anything.
- [git](https://git-scm.com/). The magical version control software.
- [himalaya](https://github.com/soywod/himalaya). Finally, a good scriptable email client.
- [lookatme](https://github.com/d0c-s4vage/lookatme). A markdown + terminal based presentation tool. Had some outstanding bugs last time I tried it.
- [minisign](https://github.com/jedisct1/minisign). A simple cli tool to sign files.
- [mpv](https://mpv.io/). Nice CLI based media player. Good for webradios, gifs, and streaming videos.
- [pa](https://github.com/biox/pa). A simple age encrypted password manager. Similar to pass, but simpler.
- [pwgen](https://linux.die.net/man/1/pwgen). A minimal password generation tool.
- [rg](https://github.com/BurntSushi/ripgrep). Search file content super fast. Faster and cooler than grep.
- [sponge](https://joeyh.name/code/moreutils/). Collect stdin before executing command.
- [sq](https://sequoia-pgp.org/). A simpler, more modern, less feature complete than gnupg, cli interface for pgp. I recommend staying away from pgp if possible though.
- [tldr](https://github.com/tldr-pages/tldr). Repo full of markdown cheatsheets for cli tools.
- [tmux](https://github.com/tmux/tmux). Terminal multiplexer.
- [transmission-cli](https://transmissionbt.com/). A popular bittorrent client.
- [ttrack](https://github.com/alanxoc3/ttrack). Time tracker CLI app.
- [unbuffer](http://expect.sourceforge.net/example/unbuffer.man.html). Trick command to think stdout is a terminal device.
- [wl-gammarelay-rs](https://github.com/MaxVerevkin/wl-gammarelay-rs). A simple daemon for changing linux/wayland brightness/temp/invert.
- [k9s](https://k9scli.io/). Tui for kubernetes management. Sometimes slow. Wish it did a bit less. But better than other things.
- [zsh](https://www.zsh.org/). The shell I currently use.
- todo: just for justfiles
- todo: dust for cleanup files

## data
- [jsonnet](https://jsonnet.org/). A JSON configuration language. I wish kubernetes used this instead of YAML by default.
- [jq](https://github.com/jqlang/jq). A JSON language. I swear JSONL is the easiest data format to work with.
- [xsv](https://github.com/BurntSushi/xsv). Master csv cli tool.
- [csvlens](https://github.com/YS-L/csvlens). A decent csv cli viewer. Ran into some visual bugs over time, but is much better than most other things I've tried.
- [ssconvert](http://www.gnumeric.org/). Just a tool for converting excel to csv.
- [dbmate](https://github.com/amacneil/dbmate). Framework agnostic cli tool to manage (postgres) schema changes.
- [psql](https://www.postgresql.org/docs/current/app-psql.html). Default postgres cli client. I can do most postgres things with psql+kak+llms.
- diff-so-fancy: for git diffs

## development tools
- [pylsp](https://github.com/python-lsp/python-lsp-server). A language server.
- aider - cursor ide like tool

## gamedev
- [pico8](https://www.lexaloffle.com/pico-8.php). The original fantasy console.
- [godot](https://godotengine.org/). FOSS game engine.
- [shrinko8](https://github.com/thisismypassport/shrinko8). Smart minifier for pico-8 lua.

## desktop
- [firefox](https://www.mozilla.org/en-US/firefox/new). Firefox is my Chromium based web browser with Vim bindings.
- [foot](https://codeberg.org/dnkl/foot). The terminal emulator I use.
- [keyd](https://github.com/rvaiya/keyd). Keyboard mapping customization actually done the right way.
- [warpd](https://github.com/rvaiya/warpd). A keynav replacement that works with wayland.
- [river](https://github.com/riverwm/river). Tiling window manager for wayland.
- [waylock](https://github.com/ifreund/waylock). Simple wayland lock screen. New version uses the ext-session-lock wayland protocol.
- todo: font: iosekva
- todo: vpn: tailscale
- physlock: can lock your computer completely
- iwd: iwctl connect to wifi
- grim: screenshot wayland
- wlr-randr
- gammastep/e

## library
- todo: chromadb
- todo: mockoon for mock webservices
- kdenlive for video editing

## editor
- [kak-ansi](https://github.com/eraserhd/kak-ansi). Ansi color codes to kakoune highlighters.
- [kak-lsp](https://github.com/kak-lsp/kak-lsp). Language server support for kakoune.
- [kakoune](http://kakoune.org/). A modal editor that closely follows the unix philosophy.

## server
- [agate](https://github.com/mbrubeck/agate). Simple gemini server written in rust.
- [archlinux](https://www.archlinux.org/). My main operating system. Nice for servers too.
- [certbot](https://certbot.eff.org/). Https for free. Thank you.
- [docker](https://www.docker.com/). Mainly used for extra layer of security on servers.
- [gemini](https://gemini.circumlunar.space/). The future of the internet.
- [ii](https://tools.suckless.org/ii/). Minimalist IRC client that uses unix pipes.
- [kineto](https://github.com/alanxoc3/kineto). Gemini to https proxy.
- [linode](https://www.linode.com/). Simple service to get a server up and running.
- [minecraft](https://www.minecraft.net/en-us). A very blocky game.
- [nginx](https://nginx.org/). Port redirection + other stuff for your server.
- [syncthing](https://syncthing.net/). Self hosted/decentralized dropbox-like replacement.
- [systemd](https://systemd.io/). Bulky, but it works great for the most part.

## services
- [asciinema](https://asciinema.org/). Super easy to record your terminal screen.
- [chatgpt](https://openai.com/blog/chatgpt). Artificial Intelligence.
- [croc](https://github.com/schollz/croc). A great/fast/secure file sharing utility + service.
- [gh](https://cli.github.com/). Github made an official CLI. Can be useful for managing PRs & issues.
- [mastodon](https://joinmastodon.org/). Decentralized alternative to twitter.
- [radico8](https://github.com/alanxoc3/radico8). The webradio I listen to for hours each week.

## wishlist
Some things I want but don't have.
- A "shuf" command that can work with large files. Maybe randomly selecting bytes. Or shuffling in batches of x number of lines, that way it works with long streams of stdin.
