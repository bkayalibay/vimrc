set background=dark
set t_Co=256
set number
set nocompatible
filetype off
syntax on
:set nowrap
set laststatus=2
let base16colorspace=256

" some neovim configuration
let g:python_host_prog = '/home/bkayalibay/anaconda3/bin/python'
let g:python3_host_prog= '/home/bkayalibay/anaconda3/bin/python'

" normal backspace
set backspace=2

" relative line numbers
set rnu

" color of column lines, used to indicate maximal line width
hi ColorColumn ctermbg=8

" Source .vimrc on save
autocmd! bufwritepost .vimrc source %

" Unified clipboard (VIM and OS)
set pastetoggle=<F2>
set clipboard=unnamed

" remap the leader key
let mapleader = ','

" Sorting shortcut (in visual selection)
vnoremap <Leader>s :sort<CR>

" Shifting code blocks left and right (visual mode)
vnoremap < <gv
vnoremap > >gv

" Quick buffer resizing
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Plugins
filetype plugin on
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle vim (plugin manager)
Plugin 'VundleVim/Vundle.vim'

" Onehalf
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

" Latex plugin
Plugin 'lervag/vimtex'

" Terminal goodies for neovim
Plugin 'vimlab/split-term.vim'

" Airline (status bar)
Plugin 'vim-airline/vim-airline'

" Airline themes (status bar)
Plugin 'vim-airline/vim-airline-themes'

" NERD tree (file tree)
Plugin 'scrooloose/nerdtree'

" Dracula (theme)
Plugin 'dracula/vim'

" Raycast (theme)
Plugin 'chriskempson/base16-vim'

" Solarized (theme)
Plugin 'altercation/vim-colors-solarized'

" Monokai (theme)
" Plugin 'sickill/vim-monokai'
"
" Lucius (theme)
Plugin 'jonathanfilip/vim-lucius'

" Monokai (theme)
Plugin 'crusoexia/vim-monokai'

" Papercolor (theme)
Plugin 'NLKNguyen/papercolor-theme'

" Cobalt2 (theme)
Plugin 'herrbischoff/cobalt2.vim'

" Luna (theme)
Plugin 'notpratheek/vim-luna'

" Angr (theme)
Plugin 'zacanger/angr.vim'

" Jedi-vim (autocompletion for python)
" Plugin 'davidhalter/jedi-vim'

" Python-mode (refactoring and general support)
Plugin 'python-mode/python-mode'

" Python PEP8 linter
Plugin 'nvie/vim-flake8'

" Python virtualenv support
Plugin 'jmcantrell/vim-virtualenv'

" Supertab (autocompletion with tab)
Plugin 'ervandew/supertab'

" Python indentation
Plugin 'vim-scripts/indentpython.vim'

" Python docstrings
Plugin 'heavenshell/vim-pydocstring'

"" YouCompleteMe (generic autocompletion)
"Plugin 'Valloric/YouCompleteMe'

" Syntastic (generic linter)
Plugin 'vim-syntastic/syntastic'

" Fugitive: (a git wrapper)
Plugin 'tpope/vim-fugitive'

" EasyMotion in VIM (some improved motions)
Plugin 'easymotion/vim-easymotion'

" General autoformatting
Plugin 'Chiel92/vim-autoformat'

" CtrlP for quick file searches
Plugin 'kien/ctrlp.vim'

" Commenter (comment blocks of text)
Plugin 'scrooloose/nerdcommenter'

" Surround.vim (bracket management)
Plugin 'tpope/vim-surround'

" Autoformat
Plugin 'psf/black'

" Python folding
Plugin 'tmhedberg/SimpylFold'

" Ipython cells
Plugin 'jpalardy/vim-slime'
Plugin 'hanschen/vim-ipython-cell'

call vundle#end()

" Start of vim-ipython-cell stuff

"------------------------------------------------------------------------------
" slime configuration 
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Use '##' to define cells instead of using marks
let g:ipython_cell_delimit_cells_by = 'tags'

" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>r to run script
autocmd FileType python nnoremap <buffer> <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
autocmd FileType python nnoremap <buffer> <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
autocmd FileType python nnoremap <buffer> <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
autocmd FileType python nnoremap <buffer> <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
autocmd FileType python nnoremap <buffer> <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
autocmd FileType python nnoremap <buffer> <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
autocmd FileType python nnoremap <buffer> [c :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap <buffer> ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
autocmd FileType python nnoremap <buffer> <Leader>h <Plug>SlimeLineSend
autocmd FileType python xnoremap <buffer> <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
autocmd FileType python nnoremap <buffer> <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>q to restart ipython
autocmd FileType python nnoremap <buffer> <Leader>q :IPythonCellRestart<CR>

" End of vim-ipython-cell stuff

" YCM settings
"let g:ycm_autoclose_preview_window_after_completion = 1
"nnoremap <C-G> :YcmCompleter GoTo<CR>

" disable python semantic completion, jedi-vim is better for me
"let g:ycm_filetype_specific_completion_to_disable = {
	"\ 'python' : 1, 
	"\ 'gitcommit' : 1
	"\}

" enable the dracula theme
"color dracula
"color solarized
"color lucius
"color PaperColor
"color cobalt2
"color luna
"color angr
"color base16-default-dark
"colorscheme inkstained

" Airline theme select
"autocmd VimEnter * AirlineTheme lucius 

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline.colorscheme='onehalfdark'


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=0
let g:syntastic_echo_current_error=0
" syntastic is rather slow for python, use python-mode instead
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_python_checkers=['mypy']

" Supertab scroll down, not up
"let g:SuperTabDefaultCompletionType = "<c-n>"

" jedi-vim settings
" Open new tab on go to definition
" let g:jedi#use_tabs_not_buffers = 1

" python-mode settings
" enable virtualenv
let g:pymode_virtualenv = 1
" turn off autocompletion, I'm using jedi-vim
" let g:pymode_rope_completion = 0
let g:pymode_rope = 0
" set python to python3
let g:pymode_python = 'python3'
" enable syntax checking, not using syntastic
let g:pymode_syntax = 1
" enable linting for python, not using syntastic
let g:pymode_lint = 1
" disable automatic python folding
let g:pymode_folding = 0
" disable linting on the fly
let g:pymode_lint_on_fly = 0
" Ignore E203
let g:pymode_lint_ignore = ["E203"]
" set the max line length to 88
let g:pymode_options_max_line_length = 79
" hack to use ipdb instead of pdb
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

let g:mkdp_port = '8894'
let g:mkdp_browser = 'firefox'
let g:mkdp_markdown_css = expand("~/github-markdown.css")

" Folding
set foldmethod=indent
set foldnestmax=2

" Terminal settings for split-term
"let g:split_term_vertical = 1
nnoremap <Leader>t :10Term<CR>
nnoremap <Leader>v :VTerm<CR>
set splitbelow
set splitright

" Python folding
" ==============
let g:SimpylFold_docstring_preview = 1

" Black
let g:black_linelength = 79

" pydocstring
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nnoremap <C-S-d> :Pydocstring<CR>

" easier window navigation
" do this in the end so that other plugins do not override
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
