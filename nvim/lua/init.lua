-- Indent the right amount for a file.
vim.api.nvim_exec([[filetype plugin indent on]], false)

vim.api.nvim_exec([[
   call plug#begin()

   Plug 'haya14busa/vim-asterisk'
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   Plug 'SirVer/ultisnips'
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
   Plug 'justinmk/vim-sneak'
   Plug 'nvim-treesitter/nvim-treesitter'
   Plug 'jamessan/vim-gnupg'
   Plug 'airblade/vim-rooter'

   " Plug 'svermeulen/vimpeccable'
   " Plug 'posva/vim-vue'
   " Plug 'qpkorr/vim-renamer'
   " Plug 'tpope/vim-fugitive'
   " Plug 'wsdjeg/vim-fetch'
   " Plug 'tpope/vim-surround'
   " Plug 'easymotion/vim-easymotion'
   " Plug 'francoiscabrol/ranger.vim'
   " Plug 'rbgrouleff/bclose.vim'
   " Plug 'majutsushi/tagbar'
   " Plug 'ntpeters/vim-better-whitespace'
   " Plug 'Quramy/vim-js-pretty-template'
   " Plug 'ap/vim-buftabline'
   " Plug 'craigemery/vim-autotag'

   call plug#end()
]], false)

pcall(function()
	require'nvim-treesitter.configs'.setup {
		ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = { enable = true }    -- false will disable the whole extension
	}
end)

vim.g.rooter_manual_only = 1
vim.g.python_host_prog  = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.buftabline_indicators = 1
vim.g.buftabline_numbers = 2
vim.g.netrw_banner = 0
vim.g.ranger_replace_netrw = 1
vim.g.ranger_map_keys = 0
vim.g["asterisk#keeppos"] = 1
vim.g["deoplete#enable_at_startup"] = 1
vim.g.mapleader = " "
vim.g.spell_under = "default"
vim.g.rooter_silent_chdir = 1
vim.g.go_fmt_autosave = 0
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsEditSplit = "vertical"

vim.o.hidden = true
vim.o.joinspaces = false
vim.o.ls = 0
vim.o.number = false
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.expandtab = true
vim.o.tabpagemax = 100
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.backspace="indent,eol,start"  -- more powerful backspacing
vim.o.history = 50  -- keep 50 lines of command line history
vim.o.ruler = true  -- show the cursor position all the time
vim.o.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg"
vim.o.rtp = vim.o.rtp .. ",/usr/share/vim/vimfiles/"
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.errorformat="[ERROR] %f:[%l\\,%v] %m"

vim.o.spell = true
vim.o.spelllang = "en_us,cjk"

vim.wo.wrap = false

vim.bo.tabstop = 3
vim.bo.shiftwidth = 3
vim.bo.expandtab = true

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
   nmap <leader>1 :b 1<CR>:file<CR>
   nmap <leader>2 :b 2<CR>:file<CR>
   nmap <leader>3 :b 3<CR>:file<CR>
   nmap <leader>4 :b 4<CR>:file<CR>
   nmap <leader>5 :b 5<CR>:file<CR>
   nmap <leader>6 :b 6<CR>:file<CR>
   nmap <leader>7 :b 7<CR>:file<CR>
   nmap <leader>8 :b 8<CR>:file<CR>
   nmap <leader>9 :b 9<CR>:file<CR>
   nmap <leader>0 :b 10<CR>:file<CR>
   nmap <leader>y :Ranger<CR>

   nmap <leader>es :e ~/.dotfiles/nvim/UltiSnips/all.snippets<CR>
   nmap <leader>ev :e ~/.dotfiles/nvim/lua/init.lua<CR>
   nmap <leader>ec :e ~/.dotfiles/nvim/lua/color.lua<CR>
   nmap <leader>ej :e ~/diary/alan/J_diary.md<CR>

   nmap <leader>fd :FZF ~/.dotfiles<CR>
   nmap <leader>ff :FZF<CR>
   nmap <leader>fF :FZF -q '<cword><CR>
   nmap <leader>fr :Rg<CR>
   nmap <leader>fc :Commands<CR>
   nmap <leader>fh :Helptags<CR>
   nmap <leader>fR :Rgw<CR>

   " status
   nmap <leader>sf :file<CR>

   nmap <leader>rl :w<CR>:luafile %<CR>
   nmap <leader>rr :luafile ~/.dotfiles/nvim/lua/init.lua<CR>
   nmap <leader>pi :PlugInstall<CR>
   nmap <leader>T :enew<cr>
   nmap <leader>l :bnext<CR>:file<CR>
   nmap <leader>h :bprevious<CR>:file<CR>
   nmap <leader>bq :bp <BAR> bd #<CR>
   nmap <leader>bd :bp <BAR> bd #<CR>
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
