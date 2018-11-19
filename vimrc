"---------------------------------------------------------------------
" Title:         Brandon's VIM Configs
" Author:        Brandon Monier
" Created:       2018-01-11 at 19:42:21
" Last Modified: 2018-11-19 at 10:05:05
"---------------------------------------------------------------------

" General Options

"" Turn on syntax
syntax on

"" Turn on line  and relative numbers
set number
set relativenumber

"" Text wrap
au BufRead,BufNewFile *.md setlocal textwidth=79

"" Set tab width to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set autoindent
set smarttab

"" Navigate with `<++>` guides (for shortcuts)
inoremap $% <Esc>/<++><Enter>"_c4l
vnoremap $% <Esc>/<++><Enter>"_c4l
map $% <Esc>/<++><Enter>"_c4l

"" vim-plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jalvesaq/Nvim-R'
"Plug 'roxma/nvim-completion-manager'
"Plug 'ncm2/ncm2'
call plug#end()

"" Nvim-R
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif

"" Lightline
set laststatus=2
let g:lightline = {
		\ 'component': {
		\   'lineinfo': '» %3l:%-2v',
		\ },
		\ 'component_function': {
		\   'readonly': 'LightlineReadonly',
		\   'fugitive': 'LightlineFugitive'
		\ },
		\ 'separator': { 'left': '▒░', 'right': '░▒' },
		\ }

"" EOL characters
:set listchars=eol:¬,space:␣

"" NERDTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" Functions

"" Last modified timestamp (updates timestamp on writes)
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}last modified: \).*#\1' .
          \ strftime('%Y-%m-%d at %H:%M:%S') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

"" Last modified timestamp (updates timestamp on writes) - Shell Scripts
function! LastModifiedSH()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last Modified: \).*#\1' .
          \ strftime('%Y-%m-%d at %H:%M:%S') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModifiedSH()

"" Timestamp Plugin
"let g:timestamp_automask = "*.sh"
let g:timestamp_automask = "*.r"
let g:timestamp_rep = '%Y-%m-%d at %H:%M:%S'


" Syntax shortcuts

"" Markdown
autocmd Filetype markdown,md inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown,md inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown,md inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown,md inoremap ;i **<Space><++><Esc>F*i
autocmd Filetype markdown,md inoremap ;h1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,md inoremap ;h2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,md inoremap ;h3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,md inoremap ;h4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown,md inoremap ;imin ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown,md inoremap ;imrf [][<++>]<Space><++><Esc>F[a
autocmd Filetype markdown,md inoremap ;url [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown,md inoremap ;hd 
    \ ---
    \ <CR>title:         <++>
    \ <CR>author:        Brandon Monier
    \ <CR>created:       <C-R>=strftime("%Y-%m-%d at %H:%M:%S")<CR>
    \ <CR>last modified: 
    \ <CR>---
    \ <CR>
    \ <CR><++>

"" Shell 
autocmd Filetype sh inoremap ;hd
    \ #!/bin/bash
    \ <CR>
    \ <CR>#---------------------------------------------------------------------
    \ <CR># Title:         <++>
    \ <CR># Author:        Brandon Monier
    \ <CR># Created:       <C-R>=strftime("%Y-%m-%d at %H:%M:%S")<CR>
    \ <CR># Last Modified: 
    \ <CR>#---------------------------------------------------------------------
    \ <CR>
    \ <CR><++>

"" R
autocmd Filetype r inoremap ;hd 
    \ #---------------------------------------------------------------------
    \ <CR># Title:         <++>
    \ <CR># Author:        Brandon Monier
    \ <CR># Created:       <C-R>=strftime("%Y-%m-%d at %H:%M:%S")<CR>
    \ <CR># Last Modified: 
    \ <CR>#---------------------------------------------------------------------
    \ <CR>
    \ <CR><++>


" Buffer
let s:vim_cache = expand('$HOME/.vim/backups')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
    call mkdir(s:vim_cache, "p", 0700)
endif



" Templates
autocmd BufNewFile *.sh,*.R,*.py,*.pl silent! exe 
    \ "!~/Development/dotfiles/scripts/templater.sh %:p" | e
