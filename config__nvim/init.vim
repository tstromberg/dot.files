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

set clipboard+=unnamedplus
set history=200          " Store last 200 commands as history.
set undolevels=200
set nocompatible         " be iMproved, required
set incsearch            " Incremental search
set pastetoggle=<F2>     " hit this on insert when pasting code in
set showmatch            " Show matching brackets.
set autowrite            " Save buffers when running GoBuild.

set hlsearch             " Highlight previous search results
set laststatus=2         " enable the status bar
set list                 " highlight whitespace
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ruler                " show the line number on the bar
set number
set showcmd              " Show (partial) command in status line.
set showmode
set smartindent

set wildmenu wildmode=longest:full
set noeb vb t_vb=        " Disable those terrible error bells.
set mouse=a

" workaround shell issues
"set shell=/bin/zsh

syntax on


" vim-plug " ------------------------------------------------------------------->
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'         " Go support
Plug 'jiangmiao/auto-pairs' " auto-pairing
Plug 'kien/ctrlp.vim'       " Fuzzy Searching
Plug 'majutsushi/tagbar'    " Sidebar Outline
Plug 'dag/vim-fish'         " fish shell highlighting
"Plug 'tomasiser/vim-code-dark'
Plug 'jacoborus/tender.vim'
Plug 'xolox/vim-misc'    " Session support.
Plug 'xolox/vim-session'    " Session support.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion
Plug 'jremmen/vim-ripgrep' " Text search
call plug#end()            " required


" UI ------------------------------------------------------------------------->
"set background=dark
"colorscheme gruvbox
"colorscheme codedark
"let g:airline_theme='solarized'
"let g:airline_theme = 'codedark'

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }
let g:airline_theme = 'tender'

"set guifont=Source\ Code\ Pro\ 11
"set t_Co=256


" Hide the toolbar.
" set guioptions -=T

" Plug settings ------------------------------------------------------------>
" Highlight everything in Go.
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_echo_command_info = 0

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1


" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=0

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" Automatic session saving.
let g:session_autoload = 'yes'
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

" COC --------------------------------------------------------------------->
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" UI ------------------------------------------------------------------------->
set background=dark
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
" set guioptions -=T

" Highlight long lines in certain languages...
au BufWinEnter,WinEnter *.cc,*.h,*.py,*.sh if !exists("w:warning_match_id") | let w:warning_match_id = matchadd('WarningMsg', '\%>80v.\+', -1) | endif

" Don't hide useful syntax highlighting when editing JSON.
let g:vim_json_syntax_conceal = 0

" Pre/Post-Write Bindings ---------------------------------------------------->
" auto-reload changes to .vimrc
au! BufWritePost .vimrc source %
au! BufWritePost .vimrc.local source %

" Type-specific overrides ---------------------------------------------------->
au FileType python setlocal expandtab list
au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab listchars=trail:. nolist
au FileType fish setlocal tabstop=4 shiftwidth=4 expandtab list
au FileType sh setlocal tabstop=2 shiftwidth=2 expandtab list
au Filetype html setlocal ts=2 sw=2 expandtab
au Filetype ruby setlocal ts=2 sw=2 expandtab
au Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au BufRead,BufNewFile *.tmpl set filetype=html


" Import local settings ------------------------------------------------------>
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

