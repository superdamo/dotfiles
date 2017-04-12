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


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Startup commands
autocmd VimEnter * NERDTree ~/Documents/Link\ to\ Homework/Outstanding
autocmd VimEnter * vertical resize 20
autocmd VimEnter * wincmd p
autocmd Filetype tex setl updatetime=1
autocmd FileType tex call pencil#init({'wrap': 'soft'})
let g:goyo_width = '70%'
let g:goyo_height = '80%'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_section_c = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline#extensions#tabline#fnamemod = ':t'
set noshowmode
set number
:filetype plugin on
:highlight LineNr ctermfg = lightgrey

"Keymaps
map <Tab> <C-W>W:cd %:p:h<CR>:<CR>
map <C-p> :LLPStartPreview<CR>
map <C-g> :Goyo<CR>
map <C-h> :Goyo!<CR>
map <C-a> :QuickRun <CR>
map <C-t> :bn<CR>
map <F5> :setlocal spell! spelllang=en_gb<CR>
