" Vundle
set nocompatible  " be iMproved, required
filetype off      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'hashivim/vim-terraform'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-markdown'
Plugin 'mileszs/ack.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()          " required
filetype plugin indent on  " required
" End Vundle

syntax enable

set hlsearch                   " highlight the latest search pattern
set incsearch                  " enable incremental searching (as you type)
set number                     " display line numbers
set shiftwidth=2               " indent text by two columns
set splitright                 " split new vertical windows to the right of the current window
set backspace=indent,eol,start "allow backspacing over autoindent, line breaks, and the start of insert

let mapleader=","                                               " override default leader '\' to ','
set shiftwidth=2                                                " indent text by two columns
filetype indent on                                              " load the index file for specific file types
set number                                                      " display line numbers
set statusline+=%f                                              " display relative file name in statusline
set hlsearch                                                    " highlight the latest search pattern
set incsearch                                                   " enable incremental searching (as you type)
set ruler                                                       " display column number
set splitright                                                  " split new vertical windows to the right of the current window
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:. " settings for visualizing tabs, spaces, etc.
set spell spelllang=en_us                                       " enable spell checking using English

" NERDTree
map <leader>n :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.swp$','\.swo$']

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" CtrlP
let g:ctrlp_show_hidden = 1

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jj <Esc> " map a more convient escape key
nmap <silent> <BS> :nohlsearch<CR> " backspace removes highlighting

