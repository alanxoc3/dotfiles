-- Indent the right amount for a file.
vim.api.nvim_exec([[filetype plugin indent on]], false)

vim.api.nvim_exec([[
   call plug#begin()

   Plug 'haya14busa/vim-asterisk'
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   Plug 'SirVer/ultisnips'

   " Plug 'svermeulen/vimpeccable'
   " Plug 'posva/vim-vue'
   " Plug 'qpkorr/vim-renamer'
   " Plug 'tpope/vim-fugitive'
   " Plug 'wsdjeg/vim-fetch'
   " Plug 'justinmk/vim-sneak'
   " Plug 'tpope/vim-surround'
   " Plug 'easymotion/vim-easymotion'
   " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
   " Plug 'jamessan/vim-gnupg'
   " Plug 'francoiscabrol/ranger.vim'
   " Plug 'rbgrouleff/bclose.vim'
   " Plug 'majutsushi/tagbar'
   " Plug 'ntpeters/vim-better-whitespace'
   " Plug 'Quramy/vim-js-pretty-template'
   " Plug 'ap/vim-buftabline'
   " Plug 'craigemery/vim-autotag'
   " Plug 'airblade/vim-rooter'

   call plug#end()
]], false)

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

vim.wo.wrap = false
vim.o.spelllang = "en"
vim.o.number = false

-- http://vim.wikia.com/wiki/Indenting_source_code
vim.bo.tabstop = 3
vim.bo.shiftwidth = 3
vim.bo.expandtab = true

vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.expandtab = true

-- Number of tabs allowed.
vim.o.tabpagemax = 100

-- More fuzzy searching.
vim.o.ignorecase = true
vim.o.smartcase = true

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

-- Commands
vim.api.nvim_exec([[
   command! -bang -nargs=0 Rg  call fzf#vim#grep('rg --line-number --no-heading --color=always --follow --hidden -g "!.git/" -g "!node_modules/" -g "!target/" -g "!tags" --case-sensitive --fixed-strings '.shellescape(<q-args>), 0, fzf#vim#with_preview({'options': '--no-hscroll --delimiter : --nth 3..'}), <bang>0)
   command! -bang -nargs=0 Rgw call fzf#vim#grep('rg --line-number --no-heading --color=always --follow --hidden -g "!.git/" -g "!node_modules/" -g "!target/" -g "!tags" --case-sensitive --fixed-strings '.shellescape(<q-args>), 0, fzf#vim#with_preview({'options': '--no-hscroll --delimiter : --nth 3.. --query '.shellescape("'".expand("<cword>"))}), <bang>0)

   cmap w!! w !sudo tee > /dev/null %
]], false)

-- Leader Mappings
vim.api.nvim_exec([[
   nmap <leader>1 <Plug>BufTabLine.Go(1)
   nmap <leader>2 <Plug>BufTabLine.Go(2)
   nmap <leader>3 <Plug>BufTabLine.Go(3)
   nmap <leader>4 <Plug>BufTabLine.Go(4)
   nmap <leader>5 <Plug>BufTabLine.Go(5)
   nmap <leader>6 <Plug>BufTabLine.Go(6)
   nmap <leader>7 <Plug>BufTabLine.Go(7)
   nmap <leader>8 <Plug>BufTabLine.Go(8)
   nmap <leader>9 <Plug>BufTabLine.Go(9)
   nmap <leader>0 <Plug>BufTabLine.Go(10)
   nmap <leader>y :Ranger<CR>
   nmap <leader>es :e ~/.dotfiles/nvim/UltiSnips/all.snippets<CR>
   nmap <leader>ev :e ~/.dotfiles/nvim/lua/init.lua<CR>
   nmap <leader>ec :e ~/.dotfiles/nvim/lua/color.lua<CR>
   nmap <leader>ej :e ~/diary/alan/J_diary.md<CR>
   nmap <leader>fd :FZF ~/.dotfiles<CR>
   nmap <leader>rl :w<CR>:luafile %<CR>
   nmap <leader>rr :luafile ~/.dotfiles/nvim/lua/init.lua<CR>
   nmap <leader>pi :PlugInstall<CR>
   nmap <leader>ff :FZF<CR>
   nmap <leader>fF :FZF -q '<cword><CR>
   nmap <leader>fr :Rg<CR>
   nmap <leader>fR :Rgw<CR>
   nmap <leader>T :enew<cr>
   nmap <leader>l :bnext<CR>
   nmap <leader>h :bprevious<CR>
   nmap <leader>bq :bp <BAR> bd #<CR>
   nmap <leader>bl :ls<CR>
   nmap <leader>t :set rnu!<CR>

   nnoremap <leader>o @='o<C-V><Esc>k'<CR>
   nnoremap <leader>O @='O<C-V><Esc>j'<CR>
]], false)

-- Other Mappings
vim.api.nvim_exec([[
   map  <F1> <Esc>

   nmap *   <Plug>(asterisk-*)
   nmap #   <Plug>(asterisk-#)
   nmap g*  <Plug>(asterisk-g*)
   nmap g#  <Plug>(asterisk-g#)
   nmap z*  <Plug>(asterisk-z*)
   nmap gz* <Plug>(asterisk-gz*)
   nmap z#  <Plug>(asterisk-z#)
   nmap gz# <Plug>(asterisk-gz#)
   nmap dK kdd
   nmap dJ jddk

   imap <F1> <Esc>
   imap jj <Esc>

   nnoremap / /\v

   if has('nvim')
      tnoremap <Esc> <C-\><C-n>
      tnoremap <C-v><Esc> <Esc>
   endif
]], false)

-- Autocmd
vim.api.nvim_exec([[
   autocmd FileType java setlocal omnifunc=javacomplete#Complete
   autocmd FileType markdown setlocal spell
   autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
   autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
   autocmd InsertLeave * match ExtraWhitespace /\s\+$/
   autocmd BufWinLeave * call clearmatches()

   augroup alan_auto_group
      autocmd FileType vue syntax sync fromstart
      autocmd FileType vue set shiftwidth=2
      autocmd FileType php setlocal makeprg=zca\ %<.php
      autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m
   augroup END

   augroup FZF
      autocmd! FileType fzf tnoremap <buffer> <esc> <esc>
   augroup END
]], false)

-- Style
vim.api.nvim_exec([[
   colorscheme alan
   syntax on
   highlight ExtraWhitespace ctermbg=red guibg=red
   match ExtraWhitespace /\s\+$/
]], false)
