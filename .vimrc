set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax linter
Plugin 'syntastic'

" Directory tree
Plugin 'scrooloose/nerdtree'

" Distraction free writing
Plugin 'junegunn/goyo.vim'

" Pencil
Plugin 'reedes/vim-pencil'

" Icons
Plugin 'ryanoasis/vim-devicons'

" NERDtree syntax highlighting
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Gutter git indicator
Plugin 'airblade/vim-gitgutter'

" Latex management
Plugin 'lervag/vimtex'

" Tab completion
Plugin 'ervandew/supertab'

" Minimap
Plugin 'severin-lemaignan/vim-minimap'

" Buffer explorer
Plugin 'ap/vim-buftabline'

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
autocmd ColorScheme * highlight LineNr ctermfg = lightgrey
autocmd! BufWinLeave ?* if !empty(glob(expand('%:p'))) | mkview | endif
autocmd! BufWinEnter ?* if !empty(glob(expand('%:p'))) | silent loadview | endif
let g:goyo_width = '70%'
let g:goyo_height = '80%'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeMouseMode = 3
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_complete_close_braces = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_view_enabled = 1
let g:vimtex_fold_enabled = 1
let g:miniBufExplModSelTarget = 1
set number
set hidden
set encoding=utf8
set laststatus=0
set mouse=a
:set pastetoggle=<F12>
highlight LineNr ctermfg = lightgrey
:filetype plugin on

"Keymaps
map <C-w> <C-w><C-w>
map <C-g> :Goyo<CR>
map <C-h> :Goyo!<CR>
map <C-t> :bn<CR>
map <C-b> :buffers<CR>
map <F7> :setlocal spell! spelllang=en_gb<CR>
map <C-n> :NERDTreeToggle ~/Documents/Link\ to\ Homework/Outstanding<CR>

"TEX Abbreviations
iabbrev FIG \begin{figure}[H]<CR><Tab>\centering<CR>\includegraphics[width=\linewidth]{}<CR>\caption{}<CR>\label{fig:}<CR><C-D>\end{figure}<CR>
iabbrev LST \begin{lstlisting}[language=Python, caption={},label={lst:}, escapechar=\%]<CR><CR>\end{lstlisting}<CR>
iabbrev PYTH \lstinline[language=Python]$$
iabbrev TAB \begin{table}[H]<CR><Tab>\centering<CR>\begin{tabular}{cc}<CR><Tab>\hline<CR><CR>\hline<CR>\hline<CR><CR>\hline<CR><C-D>\end{tabular}<CR>\caption{}<CR>\label{tab:}<CR><C-D>\end{table}<CR>
iabbrev EQ \begin{equation}<CR><CR>\end{equation}<CR>

" Legacy commands

" Buffer tab & status line
"Plugin 'bling/vim-airline'

" .tex preview
"Plugin 'xuhdev/vim-latex-live-preview'

" In editor compilation
"Plugin 'thinca/vim-quickrun'

" .csv handler
"Plugin 'chrisbra/csv.vim'

" Graphical undo tree
"Plugin 'sjl/gundo.vim'

" Startup time analyser
"Plugin 'tweekmonster/startuptime.vim'

"autocmd VimEnter * NERDTree ~/Documents/Link\ to\ Homework/Outstanding
"autocmd VimEnter * wincmd l
"autocmd Filetype tex setl updatetime=10

"let g:vimtex_view_method = 'Okular'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_c = ''
"let g:airline_section_y = ''
"let g:airline_section_z = ''
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts = 0
"let g:gundo_right = 1

"set noshowmode
"set laststatus=2
"set statusline=%#CursorColumn#\ %{mode()}\ %#ctermfg=black#\ %n\ %t\ %m%r%=%y\ %l:%c\ 
"highlight StatusLine ctermfg=black  ctermbg=lightgrey

"map <C-p> :LLPStartPreview<CR>
"map <F5> :GundoToggle<CR>
"map q :bw! __Gundo_Preview__<CR>:bw! __Gundo__<CR>
"map <C-a> :QuickRun<CR>
