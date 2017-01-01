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

" status line
Plugin 'Lokaltog/vim-powerline'

"tex preview
Plugin 'xuhdev/vim-latex-live-preview'

"distraction free writing
Plugin 'junegunn/goyo.vim'
                                                      
" In editor compilation                               
Plugin 'thinca/vim-quickrun'                          
                                                      
" csv handler                                         
Plugin 'chrisbra/csv.vim'                             
                                                    
" Limelighting                                        
Plugin 'junegunn/limelight.vim'   

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Startup commands
autocmd VimEnter * NERDTree ~/Documents/Link\ to\ Homework/Outstanding
autocmd VimEnter * vertical resize 20
autocmd VimEnter * wincmd p
autocmd Filetype tex setl updatetime=1
let g:airline#extensions#tabline#enabled = 1          
let g:airline#extensions#tabline#fnamemod = ':t'      
:filetype plugin on                                   
autocmd! User GoyoEnter Limelight                     
autocmd! User GoyoLeave Limelight!             
let g:goyo_width = '70%'                              
let g:goyo_height = '80%' 

" Limelight control                                   
let g:limelight_conceal_ctermfg = 'gray'              
let g:limelight_conceal_ctermfg = 240                 
let g:limelight_conceal_guifg = 'DarkGray'            
let g:limelight_conceal_guifg = '#777777'             
let g:limelight_default_coefficient = 0.7             
let g:limelight_paragraph_span = 1                    
let g:limelight_bop = '^\s'                           
let g:limelight_eop = '\ze\n^\s'                      
let g:limelight_priority = -1   

"Keymaps
vmap <C-c> y
vmap <C-x> x
imap <C-v> <esc> P
map <Tab> <C-W>W:cd %:p:h<CR>:<CR>
map <C-p> :LLPStartPreview<CR>
map <C-g> :Goyo<CR>
map <C-h> :Goyo!<CR>
map <C-a> :QuickRun <CR>
