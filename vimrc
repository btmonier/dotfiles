"---------------------------------------------------------------------
" Title:         Brandon's VIM Configs
" Author:        Brandon Monier
" Created:       2018-01-11 at 19:42:21
" Last Modified: 2018-03-26 at 13:23:27
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

"" Navigate with guides (for shortcuts)
inoremap $% <Esc>/<++><Enter>"_c4l
vnoremap $% <Esc>/<++><Enter>"_c4l
map $% <Esc>/<++><Enter>"_c4l

"" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
call plug#end()

"" Nvim-R
let R_in_buffer = 0
let R_term = "urxvt"
let R_assign = 2
" set vim-r-plugin to 
let r_indent_align_args = 0

" Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

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
autocmd Filetype markdown,md inoremap ;hd ---<Enter>title:         <++><Enter>author:        Brandon Monier<Enter>created:       <C-R>=strftime("%Y-%m-%d at %H:%M:%S")<CR><Enter>last modified: <Enter>---<Enter><Enter><++>

"" Any filetype with '#' comments
inoremap ;hd #---------------------------------------------------------------------<Enter># title:         <++><Enter># author:        Brandon Monier<Enter># created:       <C-R>=strftime("%Y-%m-%d at %H:%M:%S")<CR><Enter># last modified: <Enter>#---------------------------------------------------------------------<Enter><Enter><++>


"" Buffer
let s:vim_cache = expand('$HOME/.vim/backups')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
    call mkdir(s:vim_cache, "p", 0700)
endif
