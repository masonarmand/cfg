"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" :Ws - saves the file as sudo
command! Ws execute ':w !sudo tee % > /dev/null' | edit!
command! Wa echo " Dummy command so that :W doesnt activate the :Ws command
filetype plugin indent on
set history=500
set autoread
au FocusGained,BufEnter * checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USER INTERFACE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
set so=7
set ruler
set cmdheight=1
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1
set wildmenu
set completeopt-=preview
set titlestring=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS AND THEMES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme onehalflight
set background=light
colorscheme mies
syntax enable
set number
set regexpengine=0
set encoding=utf8
" set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

" Status Line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT AND TABS/INDENT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=8
set tabstop=8
set lbr
" set tw=80 " Line break on 80 characters
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Set tabwidth to 2 when editing HTML and css files
autocmd BufRead,BufNewFile *.htm,*.html,*.css,*.md,*.sh setlocal tabstop=2 shiftwidth=2 softtabstop=2
" Set tabwidth to 4 when editing rust files
autocmd BufRead,BufNewFile *.rs, *.slide setlocal tabstop=4 shiftwidth=4 softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Go to start of line (after indent) when pressing home button
map <Home> ^
imap <Home> <Esc>^i

" Makes paste not override yanked lines
vnoremap p "_dP

" Move between windows with hjkl
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Stops search highlighting on return
nnoremap <CR> :noh<CR><CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tmh :tabmove -1
map <leader>tml :tabmove +1
map <leader>t<leader> :tabnext<cr>
" Opens a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Delete trailing white space on save
fun! CleanExtraSpaces()
    " Check if the current buffer's filetype is markdown
    if &filetype != 'markdown'
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endif
endfun


if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
