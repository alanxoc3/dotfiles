let mapleader = " " 

" set spell
set number

" http://vim.wikia.com/wiki/Indenting_source_code
set tabstop=3
set shiftwidth=3

" Number of tabs allowed.
set tabpagemax=100

syntax on

" Easy sudo hack taken from
" https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

" Indent the right amount for a file.
filetype plugin indent on

" For PHP integration. Took from Arch Wiki
autocmd FileType php setlocal makeprg=zca\ %<.php
autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m

hi clear SpellBad
hi SpellBad cterm=underline

set bg=dark

" Get rid of the pesky F1 help menu taken from:
" http://vim.wikia.com/wiki/Disable_F1_built-in_help_key
map  <F1> <Esc>
imap <F1> <Esc>

" My way of making a simple line.
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2)#Supplying_a_count_to_a_map
nnoremap <leader>o @='o<C-V><Esc>k'<CR>
nnoremap <leader>O @='O<C-V><Esc>j'<CR>

" Arch vimrc file
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" go plugin
let g:go_fmt_autosave = 0

execute pathogen#infect()

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

map! xC Ĉ
map! XC Ĉ
map! xc ĉ
map! Xc ĉ
map! xG Ĝ
map! XG Ĝ
map! xg ĝ
map! Xg ĝ
map! xH Ĥ
map! XH Ĥ
map! xh ĥ
map! Xh ĥ
map! xJ Ĵ
map! XJ Ĵ
map! xj ĵ
map! Xj ĵ
map! xS Ŝ
map! XS Ŝ
map! xs ŝ
map! Xs ŝ
map! xU Ŭ
map! XU Ŭ
map! xu ŭ
map! Xu ŭ
