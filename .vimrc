" ========================================
" General Configuration
" ========================================

set nocompatible

" ======== jk as Esc andSPACE as leader
inoremap jk <esc>
let mapleader=" "

set encoding=utf-8
set number                      
set relativenumber
set backspace=indent,eol,start  
set history=1000                
set showcmd                     
set showmode                    
set showmatch
set visualbell                  
set autoread                    
set splitright
set hidden
syntax on
set autochdir
set shortmess+=c
set updatetime=300
set path+=$PWD
set path+=~/Projects

set wildmenu
set wildmode=list:full
set wildignorecase
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backup*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=vendor/**
set wildignore+=*.gem
set wildignore+=*.git
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set diffopt-=internal
set diffopt+=iwhite
set diffexpr=""


" set nobackup
" set writebackup " Enabled!
set backup
set backupext=.bak
set backupdir^=~/.vim/backup//
set patchmode=.orig

" swap directory
set directory^=~/.vim/swap//

set undofile
set undodir^=~/.vim/undo//


set nowb

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set cindent
set hlsearch
" set incsearch
set textwidth=120
set ruler
set wrapmargin=2
set nowrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

set colorcolumn=120
" highlight ColorColumn cetermbg=0 guibg=lightgray

set spell spelllang=en_us
" set list listchars=tab:\ \ ,trail:Â·


set scrolloff=5
set sidescrolloff=1
set sidescroll=1


" Enable mouse
set mouse+=a
set clipboard+=unnamed
set paste
set ma
set autowriteall

" set t_Co=256
" set cursorline
set lazyredraw
set ttyfast
set synmaxcol=150
" set foldmethod=manual 
" set foldmethod=indent
set regexpengine=1





" ========================================
" Vim plugin & bundle
" ========================================


" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean!


" Filetype off is required by vundle

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'neoclide/coc.nvim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
Plugin 'yggdroot/indentline'
Plugin 'ap/vim-css-color'
Plugin 'luochen1990/rainbow'
Plugin 'kshenoy/vim-signature'
Plugin 'janko-m/vim-test'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'thaerkh/vim-workspace'



call vundle#end()            " required

filetype plugin indent on     " required!






" ============================================
" Plugin specific configuration from plugin
" ============================================


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)




let g:workspace_create_new_tabs = 1
nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_session_name = 'session.vim'
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_always = 1




" ========================================
" More General Configuration UI
" ========================================

syntax enable
set background=dark
colorscheme gruvbox
set macligatures
set guifont=Fira\ Code:h14
set guitablabel=\[%N\]\ %t\ %M
" set termguicolors
" set guicursor+=n:ver1

let g:netrw_preview=1
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


set rtp+=/usr/local/opt/fzf

let g:rainbow_active = 1


" Vim-better-whitespace always automatically remove
" let g:strip_whitespace_on_save=1
" Do not confirm
" let g:strip_whitespace_confirm=0


" Retain code folding on file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


" Auto NORMAL MODE
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=25000
au InsertLeave * let &updatetime=updaterestore

" Auto normal mode when tab changes
autocmd TabEnter * stopinsert



" ========================================
" Keybinding, leader is SPACE
" ========================================

" :map       Normal, Visual and Operator-pending
" :vmap      Visual
" :nmap      Normal
" :omap      Operator-pending (Eg: dw where d is operator character and w is motion character)
" :map!      Insert and Command-line
" :imap      Insert
" :cmap      Command-line

" Make tabs be addressable via Apple+1 or 2 or 3, etc
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

nmap <silent> <leader>/ :nohlsearch<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap <leader>f :Files!<CR>
nnoremap <leader>bl :BLines!<CR>
nnoremap <leader>bc :BCommits!<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>e :Vexplore<CR>
nnoremap <leader>c :Commands<cr>
noremap  <leader>w :Windows<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>rg :Rg!<Right>
nnoremap <leader>t :Tags<cr>

nnoremap <leader>r :%s///g<Left><Left><Left>
nnoremap <leader>vg :vimgrep //g ./*.php<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <leader>cf :cfdo %s///gc<Left><Left><Left><Left>
nnoremap <leader>cfu :cfdo update<CR>
nnoremap <leader>ind =i{<CR> " Indentation
nnoremap <Leader>nl o<Esc><CR> " New line
