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

" Buffer tab & status line
Plugin 'bling/vim-airline'

" Tex preview
Plugin 'xuhdev/vim-latex-live-preview'

" Distraction free writing
Plugin 'junegunn/goyo.vim'

" In editor compilation
Plugin 'thinca/vim-quickrun'

" csv handler
Plugin 'chrisbra/csv.vim'

" Pencil
Plugin 'reedes/vim-pencil'

" Icons
Plugin 'ryanoasis/vim-devicons'

" NERDtree syntax highlighting
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Graphical undo tree
Plugin 'sjl/gundo.vim'

" Gutter git indicator
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Startup commands
autocmd VimEnter * NERDTree ~/Documents/Link\ to\ Homework/Outstanding
autocmd VimEnter * vertical resize 35
autocmd VimEnter * wincmd l
autocmd Filetype tex setl updatetime = 5
autocmd FileType tex call pencil#init({'wrap': 'soft'})
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview
let g:goyo_width = '70%'
let g:goyo_height = '80%'
let g:gundo_right = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatterMatchHighlightFullName = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 0
set noshowmode
set number
set encoding=utf8
:filetype plugin on
:highlight LineNr ctermfg = lightgrey

"Keymaps
map <C-w> <C-W><C-w>
map <C-p> :LLPStartPreview<CR>
map <C-g> :Goyo<CR>
map <C-h> :Goyo!<CR>
map <C-a> :QuickRun <CR>
map <C-t> :bn<CR>
map <F5> :GundoToggle<CR>
map <F7> :setlocal spell! spelllang=en_gb<CR>
map q :bw! __Gundo_Preview__<CR>:bw! __Gundo__<CR>
