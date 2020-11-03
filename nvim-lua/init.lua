vim.g.python_host_prog  = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.buftabline_indicators = 1
vim.g.buftabline_numbers = 2

-- https://shapeshed.com/vim-netrw/
vim.g.netrw_banner = 0

-- ranger plugin config
vim.g.ranger_replace_netrw = 1
vim.g.ranger_map_keys = 0

vim.g["asterisk#keeppos"] = 1
vim.g["deoplete#enable_at_startup"] = 1
vim.g.mapleader = " "

vim.g.spell_under = "default"

-- No annoying message from cwd when screen is too short. See:
vim.g.rooter_silent_chdir = 1

-- go plugin
vim.g.go_fmt_autosave = 0

-- Snippets...
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"

-- If you want :UltiSnipsEdit to split your window.
vim.g.UltiSnipsEditSplit = "vertical"

-- https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
-- This allows buffers to be hidden if you've modified a buffer.
-- This is almost a must if you wish to use buffers in this way.
vim.o.hidden = true

-- Thanks stack overflow.
vim.o.joinspaces = false

-- no status line
vim.o.ls = 0

vim.o.spelllang = "en"
vim.o.number = false
vim.o.wrap = false

-- http://vim.wikia.com/wiki/Indenting_source_code
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.expandtab = true

-- Number of tabs allowed.
vim.o.tabpagemax = 100

-- More fuzzy searching.
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.bg = "dark"

-- Arch vimrc file
vim.o.backspace="indent,eol,start"  -- more powerful backspacing

-- Now we set some defaults for the editor
vim.o.history = 50  -- keep 50 lines of command line history
vim.o.ruler = true  -- show the cursor position all the time

-- Suffixes that get lower priority when doing tab completion for filenames.
-- These are files we are not likely to want to edit or read.
vim.o.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg"

-- For vim plugins in neovim.
-- https://wiki.archlinux.org/index.php/Neovim
vim.o.rtp = vim.o.rtp .. ",/usr/share/vim/vimfiles/"

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- Some vim java thing.
vim.o.errorformat="[ERROR] %f:[%l\\,%v] %m"

-- Show object.
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
