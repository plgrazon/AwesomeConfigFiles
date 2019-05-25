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

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
  autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
  let &t_SI .= "\<Esc>[4 q"
  let &t_EI .= "\<Esc>[2 q"
  autocmd VimLeave * silent !echo -ne "\033[0 q"
endif

" FINDING FILES
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" AUTOCOMPLETE
" - ^x^n for just the current file
" - ^x^f for filenames (works with our path)
" - ^n and ^p for moving next and prev in a list

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
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Git Gutter"
set updatetime=250
let g:gitgutter_max_signs = 500
" No mapping
let g:gitgutter_map_keys = 0
" Colors
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

"Prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync 
" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'false'

" JavaScript syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Emmet for autocomplete
let g:user_emmet_leader_key=','
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
