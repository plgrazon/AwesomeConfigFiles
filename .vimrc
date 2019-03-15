" Set 256 colors for Vim
set t_Co=256'

" Add row number
set number

" Add backspace functionality
set backspace=indent,eol,start

" Set spacing to default to spaces
set tabstop=2 shiftwidth=2 expandtab

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html $

" JavaScript syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Emmet for autocmplete
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

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
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdtree'
call plug#end()

" Nerdtree
" Open Nerdtree on start
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open Nerdtree with Ctrl + N
map <C-n> :NERDTreeToggle<CR>

" Pathogen plugin manager
execute pathogen#infect()
call pathogen#helptags()