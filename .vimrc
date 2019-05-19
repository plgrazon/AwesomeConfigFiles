" Set line ending for unix
set ff=unix

" Set line ending for dos
" set ff=dos

" Set 256 colors from Vim
set t_Co=256
colorscheme desert
set background=dark

" Add row number
set number

" Add backspace functionality
set backspace=indent,eol,start

" Set spacing to default to spaces
set tabstop=2 shiftwidth=2 expandtab

" FINDING FILES
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Vim-plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

"Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html $
" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" JavaScript syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Emmet for autocomplete
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Vim-airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = "%p%% : \ue0a1:%l/%L : \ue0a3:%c"
let g:airline#extensions#whitespace#symbol = 'Ξ'

" Nerdtree
" Open Nerdtree on start
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open Nerdtree with Ctrl + N
map <C-n> :NERDTreeToggle<CR>
" Show hidden files
let NERDTreeShowHidden = 1
" Show git status for files
let g:NERDTreeShowIgnoredStatus = 1

" Pathogen plugin manager
execute pathogen#infect()
call pathogen#helptags()
