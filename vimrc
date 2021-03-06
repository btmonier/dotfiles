"---------------------------------------------------------------------
" Title:         Brandon's VIM Configs
" Author:        Brandon Monier
" Created:       2018-01-11 at 19:42:21
" Last Modified: 2019-07-17 at 17:54:52
"---------------------------------------------------------------------

" General Options

"" Turn on syntax
syntax on

"" Turn on line  and relative numbers
set number
set relativenumber

"" Text wrap
au BufRead,BufNewFile *.md setlocal textwidth=79
set linebreak

"" Automatically remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"" Set tab width to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set autoindent
set smarttab

"" 256 Colors
set t_Co=256

"" Navigate with `<++>` guides (for syntax shortcuts)
inoremap $% <Esc>/<++><Enter>"_c4l
vnoremap $% <Esc>/<++><Enter>"_c4l
map $% <Esc>/<++><Enter>"_c4l

"" EOL characters
set list
set listchars=tab:▸\ ,eol:¬,space:.

"" Yank to system
set clipboard=unnamedplus

" Vim-plug

"" vim-plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" plugins
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'gaalcaras/ncm-R'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'lervag/vimtex'
Plug 'w0rp/ale'
Plug 'flazz/vim-colorschemes'
call plug#end()

"" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
"
"" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect
"
"" NOTE: you need to install completion sources to get completions. Check
"" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'

" Lightline
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



" NERDTree
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


" Colorschemes
colorscheme Tomorrow-Night-Eighties



" Functions

"" TODO: optimize functions into one

"" Last modified timestamp (updates timestamp on writes)
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}date:\).*#\1' .
          \ strftime('   \"%Y-%m-%d at %H:%M:%S\"') . '#e'
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
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last Modified:\).*#\1' .
          \ strftime(' %Y-%m-%d at %H:%M:%S') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModifiedSH()

"" Last modified timestamp (updates timestamp on writes) - Markdown READMEs
function! LastModifiedMDR()
  if &modified
    let save_cursor = getpos(".")
    let n = line("$")
    keepjumps exe '1,' . n . 's#^\(.\{,10}\*Last Modified:\* \).*#\1' .
          \ strftime(' %Y-%m-%d at %H:%M:%S') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModifiedMDR()



" Syntax shortcuts

"" General - Markdown
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

"" Headers - Markdown
autocmd Filetype markdown,md inoremap ;hd
    \ ---
    \ <CR>title:  "<++>"
    \ <CR>author: Brandon Monier
    \ <CR>date:
    \ <CR>...
    \ <CR>
    \<++>

"" Headers - Shell
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

"" Headers - R
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

