set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'brinkqiang/Vundle.vim'
Plugin 'brinkqiang/YouCompleteMe'
Plugin 'brinkqiang/vim-go'
Plugin 'brinkqiang/Zenburn'
Plugin 'brinkqiang/vim-cpp-enhanced-highlight'

Plugin 'brinkqiang/gdbmgr'
Plugin 'brinkqiang/vim-snippets'
Plugin 'brinkqiang/nerdtree'

call vundle#end()            " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set nocompatible

set backspace=indent,eol,start
set nobackup
set history=1500
set ruler
set showcmd

set t_Co=256

set showmatch
set hlsearch
set incsearch
set ignorecase

syntax on
filetype plugin indent on
autocmd FileType text setlocal

set autoindent
set cindent
set number
set expandtab
set tabstop=2
set shiftwidth=2

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0

let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <F4> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>

let g:ycm_complete_in_comments = 1

let g:ycm_complete_in_strings = 1

let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_echo_current_diagnostic = 1

let g:ycm_auto_trigger = 1

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<cr>
imap <C-]> <esc>:YcmCompleter GoToDefinitionElseDeclaration<cr>

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:clang_format_fallback_style='~/.clang-format'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

map <F5> :call CompileRunGcc()<CR>
map <F6> :NERDTree<CR>
map <F8> :PluginInstall<CR>

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'cc' 
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'python'
        exec '!python %<'
    elseif &filetype == 'sh'
        :!bash %
    endif
endfunc

