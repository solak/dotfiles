set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/nerdtree'
Bundle 'nanki/treetop.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'henrik/vim-ruby-runner'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'elzr/vim-json'
Bundle 'thoughtbot/vim-rspec'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-vinegar'
Bundle 'endel/vim-github-colorscheme'
Bundle 'tpope/vim-dispatch'
Bundle 'mattn/webapi-vim'
Bundle 'MartinLafreniere/vim-PairTools'
Bundle 'StanAngeloff/php.vim'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-sleuth'

filetype plugin on
filetype indent on

set encoding=utf-8

set modelines=0

set autoindent
set showmode
set ttyfast
set ruler
set scrolloff=3
set nonumber
set hidden
set columns=9999

set laststatus=2

set nowrap

let mapleader=" "

" no backups

set nobackup
set nowritebackup
set noswapfile

" wildmenu
set wildmenu
set wildmode=list:longest


" two-spaces tab
set sw=2 sts=2 et
silent autocmd FileType 

" searching

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set nohlsearch
nnoremap <leader><space> :noh<cr>*/

noremap <silent><C-h> :nohls<CR>

set completeopt=longest,menuone

" Move text, but keep highlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv
"

" Y like other capitals
map Y y$

" esc replacement

inoremap jk <esc>
inoremap kj <esc>

" save on lost focus
:au FocusLost * silent! wa 

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<CR>

" easymotion
let g:EasyMotion_leader_key = '\'

" delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" graphical
if has('gui_running')
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions-=e  "ascii tabs
  set fuoptions=maxvert,background:Normal

  map <Leader>f :set invfullscreen<CR>

  set vb
endif

if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif

" solarized theme
" let g:solarized_termcolors=256
syntax enable
colorscheme solarized
set background=dark

" fullscreen
set fu

" tmp files

set dir=~/.vimtmp//,/tmp//

" gundo
"
nnoremap <Leader>u :GundoToggle<CR>

" sparkup

augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType mustache,handlebars,php,htmldjango runtime! ftplugin/html/sparkup.vim
augroup END

" window navigation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" turn off cursor blinking

set guicursor+=a:blinkon0

" copy file path to clipboard

nmap <Leader>c :let @+ = expand("%")<CR>

" jumping through methods

nmap J ]m
nmap K [m

" autoreload changed files

set autoread

" thin line on vertical split

set fillchars=vert:\│

" don't show ~ on empty lines

hi NonText guifg=bg

" don't show current mode

set noshowmode

" statusline customization

set statusline=%f%=%F

" ctrlp

nmap <C-p> :CtrlPBuffer<CR>
nmap <Leader>p :CtrlP<CR>
let g:ctrlp_regexp = 0

nmap <Tab> :CtrlPMRUFile<CR>


" MatchParen caused micro slowdowns

let loaded_matchparen = 1

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=256

" turn off folding
" set nofoldenable

" folding settings
set foldtext='➫'

highlight Folded gui=none guibg=#002b36
highlight FoldColumn  gui=none

" long comments autofolding
"autocmd FileType ruby,eruby
      "\ set foldmethod=expr |
      "\ set foldexpr=getline(v:lnum)=~'^\\s*#'


" turn of ex mode

nnoremap Q <nop>

" pairtools

" Enable modules
let g:pairtools_php_pairclamp=1
let g:pairtools_php_tagwrench=1
let g:pairtools_php_jigsaw=1
" Configure PairClamp
let g:pairtools_php_autoclose=1
let g:pairtools_php_forcepairs=0
let g:pairtools_php_closepairs='(:),[:],{:},":"' . ",':'"
let g:pairtools_php_smartclose=0
let g:pairtools_php_smartcloserules='\w'
let g:pairtools_php_apostrophe=0
let g:pairtools_php_antimagic=0
let g:pairtools_php_antimagicfield="Comment,String"
let g:pairtools_php_pcexpander=1
let g:pairtools_php_pceraser=1
" Configure TagWrench
let g:pairtools_php_tagwrenchhook='tagwrench#BuiltinHTML5Hook'
let g:pairtools_php_twexpander=1
let g:pairtools_php_tweraser=1


" syntastic

let g:syntastic_mode_map = { "mode": "passive" }
map <Leader>s :call SyntasticCheck()<CR>

" silver searcher

Plugin 'rking/ag.vim'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" whitespace
Bundle 'ntpeters/vim-better-whitespace' 
autocmd FileType ruby,eruby autocmd BufWritePre <buffer> StripWhitespace

