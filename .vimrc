set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax linter
Plugin 'scrooloose/syntastic'

" Pencil
Plugin 'reedes/vim-pencil'

" Gutter git indicator
Plugin 'airblade/vim-gitgutter'

" Latex management
Plugin 'lervag/vimtex'

" Tab completion
Plugin 'ervandew/supertab'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" List buffers in command line
Plugin 'bling/vim-bufferline'

" Distraction free writing
Plugin 'junegunn/goyo.vim'

" iA Writer inspired colour scheme
Plugin 'logico/typewriter-vim'

" iA Writer emulation for markdown
Plugin 'amix/vim-zenroom2'

" Light colour scheme
Plugin 'swalladge/paper.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable full colour support
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

" Startup commands
autocmd FileType tex call pencil#init({'wrap': 'soft'})
autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'soft'})
highlight GitGutterAdd    guifg=#005f00 ctermfg=22
highlight GitGutterChange guifg=#ffff00 ctermfg=226
highlight GitGutterDelete guifg=#d70000 ctermfg=160
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 1
let g:bufferline_modified = ' +'
set number
set hidden
set encoding=utf8
set laststatus=0
set mouse=a
set pastetoggle=<F12>
set signcolumn=number
set updatetime=100
syntax on
filetype plugin on

" Goyo colour scheme change
function! s:goyo_enter()
    colorscheme typewriter
endfunction

function! s:goyo_leave()
    colorscheme paper
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Keymaps
map <F7> :setlocal spell! spelllang=en_gb<CR>
nnoremap <silent> <leader>z :Goyo<cr>

"TEX Abbreviations
iabbrev FIG \begin{figure}[H]<CR><Tab>\centering<CR>\includegraphics[width=\linewidth]{}<CR>\caption{}<CR>\label{fig:}<CR><C-D>\end{figure}<CR>
iabbrev LST \begin{lstlisting}[language=Python, caption={},label={lst:}, escapechar=\%]<CR><CR>\end{lstlisting}<CR>
iabbrev PYTH \lstinline[language=Python]$$
iabbrev TAB \begin{table}[H]<CR><Tab>\centering<CR>\begin{tabular}{cc}<CR><Tab>\hline<CR><CR>\hline<CR>\hline<CR><CR>\hline<CR><C-D>\end{tabular}<CR>\caption{}<CR>\label{tab:}<CR><C-D>\end{table}<CR>
iabbrev EQ \begin{equation}<CR><CR>\end{equation}<CR>
