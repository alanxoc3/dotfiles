# dotfiles
alanxoc3's dotfiles. feel free to plagiarize. the following is software i use or recommend...

## commandline
- [age](https://gnupg.org/). A simple cli tool/protocol to encrypt files. Way simpler than gpg.
- [amfora](https://github.com/makeworld-the-better-one/amfora). CLI based gemini client.
- [concards](https://github.com/alanxoc3/concards). Use this to review flashcards.
- [dust](https://github.com/bootandy/dust). Easy way to find which files take up the most space on a system.
- [eza](https://github.com/eza-community/eza). A modern implementation of ls.
- [fd](https://github.com/sharkdp/fd). Search file names super fast. Faster and cooler than find.
- [feh](https://feh.finalrewind.org/). Simple image viewer.
- [fzf](https://github.com/junegunn/fzf). Fuzzy find for anything.
- [git](https://git-scm.com/). The magical version control software.
- [himalaya](https://github.com/soywod/himalaya). Finally, a good scriptable email client.
- [just](https://github.com/casey/just). Easy way to organize many tiny similar commands/aliases into 1 command.
- [k9s](https://k9scli.io/). Tui for kubernetes management. Sometimes slow. Wish it did a bit less. But better than other things.
- [minisign](https://github.com/jedisct1/minisign). A simple cli tool to sign files.
- [mpv](https://mpv.io/). Nice CLI based media player. Good for webradios, gifs, and streaming videos.
- [pa](https://github.com/biox/pa). A simple age encrypted password manager. Similar to pass, but simpler.
- [pwgen](https://linux.die.net/man/1/pwgen). A minimal password generation tool.
- [rg](https://github.com/BurntSushi/ripgrep). Search file content super fast. Faster and cooler than grep.
- [slides](https://github.com/maaslalani/slides). A markdown + terminal based presentation tool.
- [sponge](https://joeyh.name/code/moreutils/). Collect stdin before executing command.
- [sq](https://sequoia-pgp.org/). A simpler, more modern, less feature complete than gnupg, cli interface for pgp. I recommend staying away from pgp if possible though.
- [tinyxxd](https://github.com/xyproto/tinyxxd). For all your hex viewing needs.
- [tldr](https://github.com/tldr-pages/tldr). Repo full of markdown cheatsheets for cli tools.
- [tmux](https://github.com/tmux/tmux). Terminal multiplexer.
- [transmission-cli](https://transmissionbt.com/). A popular bittorrent client.
- [ttrack](https://github.com/alanxoc3/ttrack). Time tracker CLI app.
- [unbuffer](http://expect.sourceforge.net/example/unbuffer.man.html). Trick command to think stdout is a terminal device.
- [wl-gammarelay-rs](https://github.com/MaxVerevkin/wl-gammarelay-rs). A simple daemon for changing linux/wayland brightness/temp/invert.
- [zsh](https://www.zsh.org/). The shell I currently use.
- [flite](https://github.com/festvox/flite). Convenient + tiny speech synthesis.

## data
- [csvlens](https://github.com/YS-L/csvlens). A decent csv cli viewer. Ran into some visual bugs over time, but is much better than most other things I've tried.
- [dbmate](https://github.com/amacneil/dbmate). Framework agnostic cli tool to manage (postgres) schema changes.
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy). Makes `git diff` and `diff -u` look a bit better. Looking for a good side-by-side diff viewer though.
- [jq](https://github.com/jqlang/jq). A JSON language. I swear JSONL is the easiest data format to work with.
- [jsonnet](https://jsonnet.org/). A JSON configuration language. I wish kubernetes used this instead of YAML by default.
- [psql](https://www.postgresql.org/docs/current/app-psql.html). Default postgres cli client. I can do most postgres things with psql+kak+llms.
- [ssconvert](http://www.gnumeric.org/). Just a tool for converting excel to csv.
- [xsv](https://github.com/BurntSushi/xsv). Master csv cli tool.

## development
- [mockoon](https://mockoon.com/). Good way to create WS mocks for integration testing.
- [opencode](https://github.com/sst/opencode). A fantastic cursor/claude-code/aider alternative built for people like me!
- [pylsp](https://github.com/python-lsp/python-lsp-server). A language server.
- [uv](https://github.com/astral-sh/uv). A modern/easier/faster/better python pip+venv replacement.

## gamedev
- [pico8](https://www.lexaloffle.com/pico-8.php). The original fantasy console.
- [shrinko8](https://github.com/thisismypassport/shrinko8). Smart minifier for pico-8 lua.

## desktop
- [greetd](https://sr.ht/~kennylevinsen/greetd/). Minimal login manager daemon.
- [agreety](https://sr.ht/~kennylevinsen/greetd/). Comes with greetd, a simple login manager tty frontend.
- [chromium](https://www.chromium.org/getting-involved/download-chromium/). I always come back to chromium as my browser. It just works and it's fast. Maybe I'll switch again later.
- [fcitx5](https://fcitx-im.org/wiki/Fcitx_5). CJK input, works with wlroots. Much better than pre-v5.
- [foot](https://codeberg.org/dnkl/foot). The terminal emulator I use.
- [gammastep](https://gitlab.com/chinstrap/gammastep). Redshift for wayland, makes your screen red and easy on the eyes.
- [grim](https://sr.ht/~emersion/grim/). Screenshot for wlroots/wayland.
- [ioskva](https://github.com/be5invis/Iosevka). A comprehensive terminal font.
- [iwd](https://archive.kernel.org/oldwiki/iwd.wiki.kernel.org/). Finally, a wifi solution that is actually easy to use from the CLI.
- [kdenlive](https://kdenlive.org/en/). A video editor. I used this once, I would love a more lightweight & fast solution though.
- [keyd](https://github.com/rvaiya/keyd). Keyboard mapping customization actually done the right way.
- [physlock](https://github.com/xyb3rt/physlock). A simple solution to lock a linux computer including all TTYs.
- [sway](https://github.com/swaywm/sway). Tiling window manager for wayland. I wanna switch to hyperland though.
- [tailscale](https://tailscale.com/). Very easy way to setup a vpc between laptops/servers.
- [warpd](https://github.com/rvaiya/warpd). A keynav replacement that works with wayland. Currently has a bug when used with fcitx5.
- [waylock](https://github.com/ifreund/waylock). Simple wayland lock screen. New version uses the ext-session-lock wayland protocol.
- [wlr-randr](https://sr.ht/~emersion/wlr-randr/). Monitor management randr tool but for wayland.

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
- [croc](https://github.com/schollz/croc). A great/fast/secure file sharing utility + service.
- [gh](https://cli.github.com/). Github made an official CLI. Can be useful for managing PRs & issues.
- [kagi](https://kagi.com/). A better search engine.
- [mastodon](https://joinmastodon.org/). Decentralized alternative to twitter.
- [radico8](https://github.com/alanxoc3/radico8). The webradio I listen to for hours each week.
- [crds-catalog](https://github.com/datreeio/CRDs-catalog/blob/main/Utilities/annotate-yaml.py). Useful for getting yaml language server support for kubernetes resources.

## wishlist
Some things I want but don't have.
- A "shuf" command that can work with large files. Maybe randomly selecting bytes. Or shuffling in batches of x number of lines, that way it works with long streams of stdin.
