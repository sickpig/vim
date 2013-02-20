" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" encondig guys
set encoding=utf-8
set t_Co=256 

" Pathogen: runtime path manipulation
call pathogen#infect()

" solarized theme
set background=dark
colorscheme solarized

" TN theme 
"set background=light
"colorscheme Tomorrow-Night

" Set to auto read when a file is changed from the outside
set autoread

" The current buffer can be put to the background without writing to disk
" reload marks and undo history of background buffer becomes current again
set hidden
set history=500 " boost history buffer

" make cmpletion more bash / dash like
set wildmenu
set wildmode=list:longest,full

" viewport related
set scrolloff=3
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" centralized swp files
set directory=~/.vim/tmp

" Make NerdTree persistent across tabs 
" you need :NERDTreeTabsToggle to activate 
" NERD panel in all tabs (see :help leader
" default Leader chars is backslash if you want
" you can remap that with mapleader
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" When on, splitting a window will put the new window right of the
" current one. :vsplit
set splitright

" setting up backup dir
set backup
set backupdir=~/.vim/backup/

" Set a title on the terminal
set title

" setting up status bar properly
set laststatus=2                 " Always display the status line
set shortmess=atI                " Enable short messages (press a key is annoying)
set statusline=%r%t%m\ \Buffer:\ %n\ %=Line\ %l/%L\ \ Col:\ %c\ (%p%%)\ [%{strftime('%H:%M')}]

" enable line numbering an all files 
set number
set showmatch " Show matching brackets.
set smartcase " Case insensitive searches become sensitive with capitals

" Remapping

" map tab navigation
nnoremap  <C-l> :tabn<CR>
nnoremap  <C-h> :tabp<CR>

" map PageUp PageDown 
nnoremap  <C-k> <PageUp>
nnoremap  <C-j> <PageDown>

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" Enable file type detection and do language-dependent indenting.
filetype plugin indent on


augroup myfiletypes
  " Clear old autocmds in group  
  " autocmd!
  autocmd FileType tcl  setlocal is tw=0 si ai sta sw=4 ts=4 | set list! | set list listchars=trail:.,tab:\ \ ,eol:¬ 
  autocmd Filetype html,xml,xsl,erb source ~/.vim/scripts/closetag.vim 
  autocmd FileType ruby setlocal softtabstop=2 expandtab sw=2 ts=2 | set list! | set list listchars=trail:.,tab:\ \ ,eol:¬ 
  autocmd FileType javascript setlocal softtabstop=2 expandtab sw=2 ts=2 | set list! | set list listchars=trail:.,tab:.>,eol:¬ 
  autocmd BufRead,BufNewFile psql.edit.*  set filetype=sql
  autocmd BufRead,BufNewFile *.sps  set filetype=sps
  autocmd BufRead,BufNewFile *.bla set filetype=logtalk | set list listchars=tab:>.,trail:. ai sw=2 sts=2 et 
augroup END

" subversion commit messages need not be backed up
if has("autocmd")
	autocmd BufRead svn-commit.tmp :setlocal nobackup
	
	" always jump to last edit position when opening a file
  	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	      \| exe "normal g'\"" | endif
endif
