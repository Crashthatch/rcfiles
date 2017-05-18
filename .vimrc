set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" javascript highglighting
Plugin 'crusoexia/vim-monokai'
Plugin 'altercation/solarized'
set t_Co=256
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized "monokai

" line numbers (Still required when using relativenumber so that the current
" line doesn't show up as 0)
set number

" Do not use tabs- use spaces to indent.
set expandtab
set tabstop=2
set shiftwidth=2

" highlight all matches when searching
set hlsearch

" Nerdtree
Plugin 'scrooloose/nerdtree'
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

Plugin 'kien/ctrlp.vim'

" Syntastic - error checking for many languages
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']

"Javascript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter'
Plugin 'crusoexia/vim-javascript-lib'

"PHP
Plugin 'StanAngeloff/php.vim'
"let g:php_syntax_extensions_enabled = 1
"let php_var_selector_is_identifier = 1
let php_var_selector_is_identifier = 0
function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
	hi! phpFunctions ctermfg=172 ctermbg=NONE cterm=NONE
	hi! phpVarSelector ctermfg=69 ctermbg=NONE cterm=NONE
	hi! phpMemberSelector ctermfg=136 ctermbg=NONE cterm=NONE
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

"Bundle 'joonty/vim-phpqa.git'
"let g:phpqa_messdetector_autorun = 0
"let g:phpqa_codesniffer_autorun = 0

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'

Bundle "ternjs/tern_for_vim"
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

"Relative line numbers when moving around.
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
"When vi doesn't have focus, show line numbers as we're not moving about!
"(Doesn't affect command-line vim).
:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber
"Use regular line numbers when we're in insert mode (as we can't do stuff to
"multiple lines.
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"Show changed lines according to git.
Plugin 'airblade/vim-gitgutter'

"VIM-wide var, but most noticable on the git plugin.
set updatetime=1000
