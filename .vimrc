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
:filetype plugin on
let g:goyo_width = '70%'
let g:goyo_height = '80%'
autocmd FileType tex call pencil#init({'wrap': 'soft'})

"Keymaps
vmap <C-c> y
vmap <C-x> x
imap <C-v> <esc> P
map <Tab> <C-W>W:cd %:p:h<CR>:<CR>
map <C-p> :LLPStartPreview<CR>
map <C-g> :Goyo<CR>
map <C-h> :Goyo!<CR>
map <C-a> :QuickRun <CR>
