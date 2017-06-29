" Reminders
" 
" Use Ctrl-P more often.

" General settings. ---------------------------------------------------------->
set autochdir            " set working directory to match the current file
set backup
set backupdir=~/.vim/backup

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

set history=200          " Store last 200 commands as history.
set nocompatible              " be iMproved, required
set incsearch            " Incremental search
set pastetoggle=<F2>     " hit this on insert when pasting code in
set undolevels=200
set showmatch            " Show matching brackets.
set autowrite            " Save buffers when running GoBuild.

" set hlsearch             " Highlight previous search results
" set laststatus=2         " enable the status bar
" set list                 " highlight whitespace
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ruler                " show the line number on the bar
"set shiftwidth=2         " number of space characters inserted for indentation
"set showcmd              " Show (partial) command in status line.
"set showmode
"set smartindent
"set softtabstop=2        " How many spaces to insert if you hit tab.
"set tabstop=2            " Viewing a real tab uses two columns.

"set wildmenu wildmode=longest:full
set noeb vb t_vb=        " Disable those terrible error bells.
set mouse=a

syntax on

" Vundle " ------------------------------------------------------------------->
" https://github.com/gmarik/Vundle.vim
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Other Plugins go here.
" DISABLED: Using Google specific version.
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'     " CSS color highlighting.
Plugin 'fatih/vim-go'         " Go support
Plugin 'jiangmiao/auto-pairs' " auto-pairing
Plugin 'kien/ctrlp.vim'       " Fuzzy Searching
Plugin 'majutsushi/tagbar'    " Sidebar Outline
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-misc'    " Session support.
Plugin 'xolox/vim-session'    " Session support.
call vundle#end()            " required
filetype plugin indent on    " required


" UI ------------------------------------------------------------------------->
set background=dark
colorscheme gruvbox
let g:airline_theme='solarized'
set guifont=Source\ Code\ Pro\ 11
set t_Co=256

" Hide the toolbar.
set guioptions -=T

" Plugin settings ------------------------------------------------------------>
" Highlight everything in Go.
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_info_mode = 'guru'
"let g:go_metalinter_command = '~/bin/gometalinter'
"let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'g3build', 'g3vet']
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

" Attempt to execute the metalinter on save.
":autocmd BufWritePre *.go :GoMetaLinter

" ,b and ,r to build Go code. Necessary?
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" Automatic session saving.
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5

" List buffers at the top.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Key/Command mappings ------------------------------------------------------->
nnoremap ; :
cmap w!! w !sudo tee % >/dev/null
let mapleader=','

" By default all window-related commands are under <C-w>, but these allow switching windows with <C-{hjkl}>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Show a tagbar if F8 is hit.
nmap <F8> :TagbarToggle<CR>

" Toggle folds
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" ,a to close the quickfix
nnoremap <leader>a :cclose<CR>

" UI ------------------------------------------------------------------------->
set background=dark
colorscheme gruvbox
" let g:airline_theme='papercolor'
" let g:lightline = { 'colorscheme': 'PaperColor' }
set guifont=Source\ Code\ Pro\ 9
set t_Co=256
let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }


" hate whitespace: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default link TrailingWhitespace Error
augroup filetypedetect
  autocmd WinEnter,BufNewFile,BufRead * match TrailingWhitespace /\s\+$/
augroup END
autocmd InsertEnter * match none
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

" Hide the toolbar.
set guioptions -=T

" Highlight long lines in certain languages...
au BufWinEnter,WinEnter *.cc,*.h,*.py,*.sh if !exists("w:warning_match_id") | let w:warning_match_id = matchadd('WarningMsg', '\%>80v.\+', -1) | endif

" Don't hide useful syntax highlighting when editing JSON.
let g:vim_json_syntax_conceal = 0

" Pre/Post-Write Bindings ---------------------------------------------------->
" auto-reload changes to .vimrc
au! BufWritePost .vimrc source %
au! BufWritePost .vimrc.local source %

" Type-specific overrides ---------------------------------------------------->
autocmd FileType python setlocal expandtab list
au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab

" Import local settings ------------------------------------------------------>
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

