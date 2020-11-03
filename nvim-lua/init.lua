-- Indent the right amount for a file.
vim.api.nvim_exec([[filetype plugin indent on]], false)

vim.api.nvim_exec([[
	call plug#begin()
	" 4 Kotlin
	Plug 'udalov/kotlin-vim'
	Plug 'osamuaoki/vim-spell-under' " Allows spell and syntax to work well together.
	Plug 'justinj/vim-pico8-syntax'
	Plug 'posva/vim-vue'
	Plug 'qpkorr/vim-renamer'
	Plug 'tpope/vim-fugitive'
	Plug 'wsdjeg/vim-fetch'
	Plug 'justinmk/vim-sneak'
	Plug 'easymotion/vim-easymotion'

	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	" Plug 'fatih/vim-go'

	" Conquer of Completion LSP
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Deoplete
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	" Cool
	Plug 'haya14busa/vim-asterisk'
	Plug 'NLKNguyen/vim-maven-syntax'

	" gpg :)
	Plug 'jamessan/vim-gnupg'
	Plug 'mxw/vim-jsx'

	" https://github.com/francoiscabrol/ranger.vim
	Plug 'francoiscabrol/ranger.vim'
	Plug 'rbgrouleff/bclose.vim'

	" Some Quade plugins
	Plug 'tpope/vim-surround'
	Plug 'majutsushi/tagbar'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" https://github.com/ntpeters/vim-better-whitespace
	Plug 'ntpeters/vim-better-whitespace'

	" for typescript
	Plug 'ianks/vim-tsx'
	Plug 'leafgarland/typescript-vim'
	Plug 'Quramy/vim-js-pretty-template'

	" Plug 'vim-airline/vim-airline'
	Plug 'ap/vim-buftabline'

	Plug 'craigemery/vim-autotag'
	Plug 'airblade/vim-rooter'
	Plug 'mileszs/ack.vim'

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

vim.api.nvim_exec([[
	" for switching between tabs/buffers.
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

	map <leader>y :Ranger<CR>

	map <leader>s :e ~/.dotfiles/snips/all.snippets<CR>

	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType markdown setlocal spell

	nmap dK kdd
	nmap dJ jddk

	nmap <leader>f :FZF<CR>
	nmap <leader>F :FZF -q '<cword><CR>
	nmap <leader>r :Rg<CR>
	nmap <leader>R :Rgw<CR>

	" To open a new empty buffer
	" This replaces :tabnew which I used to bind to this mapping
	nmap <leader>T :enew<cr>

	" Move to the next buffer
	nmap <leader>l :bnext<CR>

	" Move to the previous buffer
	nmap <leader>h :bprevious<CR>

	" Close the current buffer and move to the previous one
	" This replicates the idea of closing a tab
	nmap <leader>bq :bp <BAR> bd #<CR>

	" Show all open buffers and their status
	nmap <leader>bl :ls<CR>

	" Quade things.
	nnoremap / /\\v
	nnoremap <leader>t :set rnu!<CR>

	" Quade thing, for stupid terminal emulator.
	if has('nvim')
		tnoremap <Esc> <C-\\><C-n>
		tnoremap <C-v><Esc> <Esc>
	endif

	syntax on

	" Easy sudo hack taken from
	" https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
	cmap w!! w !sudo tee > /dev/null %

	" Get rid of the pesky F1 help menu taken from:
	" http://vim.wikia.com/wiki/Disable_F1_built-in_help_key
	map  <F1> <Esc>
	imap <F1> <Esc>

	" My way of making a simple line.
	" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2)#Supplying_a_count_to_a_map
	nnoremap <leader>o @='o<C-V><Esc>k'<CR>
	nnoremap <leader>O @='O<C-V><Esc>j'<CR>

	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\\s\\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\\s\\+$/
	autocmd InsertEnter * match ExtraWhitespace /\\s\\+\\%#\\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\\s\\+$/
	autocmd BufWinLeave * call clearmatches()

	" Quade told me about this auto group thing. So it doen't run again when you
	" source.
	augroup alan_auto_group
		" For vue, and maybe other syntax things.
		autocmd FileType vue syntax sync fromstart
		autocmd FileType vue set shiftwidth=2

		" For PHP integration. Took from Arch Wiki
		autocmd FileType php setlocal makeprg=zca\\ %<.php
		autocmd FileType php setlocal errorformat=%f(line\\ %l):\\ %m
	augroup END

	" Use fd for ctrlp.
	" https://www.reddit.com/r/vim/comments/83h31q/speed_up_ctrlp_with_fd/
	if executable('fd')
	    let g:ctrlp_user_command = 'fd -c never "" "%s"'
	    let g:ctrlp_use_caching = 0
	endif

	" My ripgrep fzf things :).
	command! -bang -nargs=0 Rg  call fzf#vim#grep('rg --line-number --no-heading --color=always --follow --hidden -g "!.git/" -g "!node_modules/" -g "!target/" -g "!tags" --case-sensitive --fixed-strings '.shellescape(<q-args>), 0, fzf#vim#with_preview({'options': '--no-hscroll --delimiter : --nth 3..'}), <bang>0)
	command! -bang -nargs=0 Rgw call fzf#vim#grep('rg --line-number --no-heading --color=always --follow --hidden -g "!.git/" -g "!node_modules/" -g "!target/" -g "!tags" --case-sensitive --fixed-strings '.shellescape(<q-args>), 0, fzf#vim#with_preview({'options': '--no-hscroll --delimiter : --nth 3.. --query '.shellescape("'".expand("<cword>"))}), <bang>0)

	augroup FZF
		autocmd! FileType fzf tnoremap <buffer> <esc> <esc>
	augroup END

	" Asterisk plugin :D.
	nmap *   <Plug>(asterisk-*)
	nmap #   <Plug>(asterisk-#)
	nmap g*  <Plug>(asterisk-g*)
	nmap g#  <Plug>(asterisk-g#)
	nmap z*  <Plug>(asterisk-z*)
	nmap gz* <Plug>(asterisk-gz*)
	nmap z#  <Plug>(asterisk-z#)
	nmap gz# <Plug>(asterisk-gz#)
]], false)
