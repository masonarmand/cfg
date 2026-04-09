let mapleader = ","
nnoremap <leader>w :w!<CR>

filetype plugin indent on

set history=500
set autoread

autocmd FocusGained,BufEnter * checktime
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufWritePre * call CleanExtraSpaces()

let g:netrw_banner = 0
" let g:netrw_liststyle = 3

set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set wildmenu
set scrolloff=7

set background=light
colorscheme plan9
syntax enable
set number
set encoding=utf-8

set nobackup
set nowritebackup
set noswapfile

set expandtab
set shiftwidth=8
set tabstop=8
set linebreak
set autoindent
set smartindent
set wrap

autocmd FileType vim,html,css,markdown,sh setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

nnoremap <Home> ^
inoremap <Home> <C-o>^

" preserve yanked text when pasting over selection
vnoremap p "_dP

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

nnoremap <CR> :nohlsearch<CR><CR>

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<CR>/

function! CleanExtraSpaces()
  if &filetype !=# 'markdown'
    let save_cursor = getpos(".")
    let old_search = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_search)
  endif
endfunction
