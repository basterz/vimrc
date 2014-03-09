syntax on
syntax enable

filetype on
filetype indent on
filetype plugin on

call pathogen#infect()

set nocompatible
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab

set smartcase
set gdefault
set incsearch
set showmatch

set winwidth=84
set winheight=5
set winminheight=5
set winheight=9999

set scrolloff=5

set number
set noswapfile
set visualbell

set cc=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           My variables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Auto commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" HTML 
augroup HTMLCommands
  autocmd!
  autocmd BufRead,BufNewFile *.html setfiletype html
  " Auto format file
  autocmd BufRead,BufWritePre *.html normal gg=G
  " Comments will be with pres '//'
  autocmd Filetype html nnoremap <buffer> <leader>c I <!--<esc>A--><esc>
augroup END

 " JavaScript
augroup JavaScriptCommands
  autocmd!
  autocmd BufRead,BufNewFile *.js setfiletype javascript
  " Auto format file
  autocmd BufRead,BufWritePre *.js normal gg=G
  " Comment Javascript
  autocmd Filetype javascript nnoremap <buffer>  <leader>c I//<esc>
augroup END

" Ruby
augroup RubyCommands
  autocmd!
  set cursorline
  autocmd BufRead,BufNewFile *.ru setfiletype ruby
  " Auto format file
  autocmd BufRead,BufWritePre *.js normal gg=G
  " Comment Javascript
augroup END

" PHP
augroup PHPCommands
  autocmd!
  autocmd BufRead,BufNewFile *.php setfiletype php 
  " Auto format file
  autocmd BufRead,BufWritePre .php normal gg=G
  " Comment Javascript
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           My Shortcuts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Insert newline without entering insert mode
" Source:
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode 
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
nmap <C-S-P> :call <SID>SynStack()<CR>

noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

onoremap p i(

" Autocomplete
function! InsertTabWrapper()
  let col = col(".") - 1
  if !col || getline(".")[col - 1] !~ '\k'
    return "\<tab>"
  else 
    return "\<c-n>"
endfunction
inoremap <TAB> <C-r>=InsertTabWrapper()<CR>
" inoremap <Nul> <C-n>
inoremap <S-TAB> <C-p>

" Reg exp
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
nnoremap ? ?\v

nnoremap <leader><space> :noh<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           NERDTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" How can I open a NERDTree automatically when vim starts up if no files were
" specified?
autocmd vimenter * if !argc() | NERDTree | endif

" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
