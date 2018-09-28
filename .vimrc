set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'  "snippet engine
Plugin 'honza/vim-snippets' "snippets library
Plugin 'sjl/gundo.vim'
" Additional plugins desired - 
" From https://github.com/Valloric/dotfiles/blob/master/vim/vimrc.vim#L3
" tcomment_vim
" command-T?
" gundo.vim
" vim-surround?
" ultisnips
" MatchTagAlways
" vim-cpp-enhanced-highlight
" vim-git
" vim-repeat
" python_match
" snippets


" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" After adding a new package - load vim and command :PluginInstall!


let g:syntastic_quiet_messages = {"type": "style"}

"From https://github.com/rasendubi/dotfiles/blob/master/.vim/.ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" Load the default python first found in PATH
let g:ycm_python_binary_path = 'python'
" Jump to definition of variable with ctrl-p, ctrl-o to jump back
nnoremap <C-P> :YcmCompleter GoTo<CR>


set number  "Show line numbers
set rnu "Sets relative numbers

"Best if tabstop==shiftwidth==softtabstop
set tabstop=4      "specifies width of a tab char
set shiftwidth=4   "determines amount of space to be used with tab shifting in normal mode
set softtabstop=4  "Set backspace to delete 4 spaces, to match tab indent
set expandtab      "causes spaces to be used instead of tab
"set smartindent

"Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"Delete EOL whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
call cursor(l, c)
endfunction
"Auto-call function on save
autocmd BufWritePre *.py,*.js,*.c,*.cpp :call <SID>StripTrailingWhitespaces()

set autoindent  "on new lines, match indent of previous line
set copyindent "copy the previous indentation on autoindenting
set cindent  "smart indenting for c-like code
set smarttab  "smart tab handling for indenting?

set autoread  "auto read when a file is changed from outside

set ignorecase  "case insentitive searching
set smartcase   "but case sensitive if uppercase chars included


set colorcolumn=80

"Tab shortcuts
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

:map - dd p
:map <space> viw
:map <c-d> dd

set t_Co=256
set background=dark
colo gruvbox

set cursorline   "Highlight current line


"Windows shortcuts - maybe use caps instead?
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
"Shortcuts for splitting windows - these keys might be used?
"map <C-v> <C-w>v
"map <C-s> <C-w>s

"ctrl-v ctrl-i  "Insert tab (even if tab to spaces is on)


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
