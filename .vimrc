set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax linter
Plugin 'syntastic'

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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable full colour support
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

" Startup commands
autocmd FileType tex call pencil#init({'wrap': 'soft'})
autocmd FileType md call pencil#init({'wrap': 'soft'})
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 1
let g:bufferline_modified = ' +'
set number
set hidden
set encoding=utf8
set laststatus=0
set mouse=a
:set pastetoggle=<F12>
:syntax on
:filetype plugin on

" Keymaps
map <F7> :setlocal spell! spelllang=en_gb<CR>

"TEX Abbreviations
iabbrev FIG \begin{figure}[H]<CR><Tab>\centering<CR>\includegraphics[width=\linewidth]{}<CR>\caption{}<CR>\label{fig:}<CR><C-D>\end{figure}<CR>
iabbrev LST \begin{lstlisting}[language=Python, caption={},label={lst:}, escapechar=\%]<CR><CR>\end{lstlisting}<CR>
iabbrev PYTH \lstinline[language=Python]$$
iabbrev TAB \begin{table}[H]<CR><Tab>\centering<CR>\begin{tabular}{cc}<CR><Tab>\hline<CR><CR>\hline<CR>\hline<CR><CR>\hline<CR><C-D>\end{tabular}<CR>\caption{}<CR>\label{tab:}<CR><C-D>\end{table}<CR>
iabbrev EQ \begin{equation}<CR><CR>\end{equation}<CR>
