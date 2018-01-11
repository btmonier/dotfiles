"--------------------------------------------------------------------
" Title:  Brandon's VIM Configs
" Author: Brandon Monier
" Date:   01.05.18
"--------------------------------------------------------------------

" General Options

"" Turn on syntax
syntax on

"" Turn on line  and relative numbers
set number
set relativenumber

"" Set tab width to 4 spaces
set tabstop=4

"" Navigate with guides (for shortcuts)
inoremap $% <Esc>/<++><Enter>"_c4l
vnoremap $% <Esc>/<++><Enter>"_c4l
map $% <Esc>/<++><Enter>"_c4l

"" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'
call plug#end()

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

"" R
autocmd Filetype sh,r,R inoremap ;hd #---------------------------------------------------------------------<Enter># Title:  <++><Enter># Author: Brandon Monier<Enter># Date:   <C-R>=strftime("%Y-%m-%d")<CR><Enter>#---------------------------------------------------------------------<Enter><Enter><++>

"" Bash
autocmd Filetype sh inoremap ;hd #!/bin/bash<Enter><Enter>#---------------------------------------------------------------------<Enter># Title:  <++><Enter># Author: Brandon Monier<Enter># Date:   <C-R>=strftime("%Y-%m-%d")<CR><Enter>#---------------------------------------------------------------------<Enter><Enter><++>














