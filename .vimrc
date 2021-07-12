" File: .vimrc
" Maintainer: Worthyox
"  ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"  ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"   ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"      ░░   ▒ ░░      ░     ░░   ░ ░
"       ░   ░         ░      ░     ░ ░
"      ░                           ░
"
" Quick Init: {{{1 "
" block plugins and extra dependency's
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" Disable extra plugins
let g:loaded_gzip               =  1
let g:loaded_tarPlugin          =  1
let g:loaded_zipPlugin          =  1
let g:loaded_2html_plugin       =  1
"don't use any remote plugins so no need to load them
let g:loaded_rrhelper           =  1
let g:loaded_remote_plugins     =  1
let g:loaded_netrw              =  1
let g:loaded_netrwPlugin        =  1
" 1}}} "Quick Init

" Plugins: {{{1 "
" install vim-plug if it's not already
"augroup PLUGGED
"    if empty(glob('~/.vim/autoload/plug.vim'))  " Vim
"        silent !curl -fo ~/.vim/autoload/plug.vim --create-dirs
"                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"    endif
"augroup end
"call plug#begin('~/.config/nvim/plugged')
"Plug 'gavinok/spaceway.vim'
"call plug#end()
" 1}}} "Plugins

" Functions And Commands: {{{1 "
" White space {{{2
" remove trailing whitespaces
command! StripWhitespace :%s/\s\+$//e
" 2}}} "White Space
" 1}}} "Functions and Commands

" General Settings: {{{1 "
set listchars=tab:→\ ,trail:·,nbsp:·            "Show white space
set nowritebackup nobackup noswapfile           "Remove backup and swap files
set encoding=utf-8                              "Allow emojis in vimrc
scriptencoding utf-8                            "Allow emojis in vimrc
set fileencoding=utf-8                          "The encoding written to file
"set clipboard=unnamedplus                       "Copy/paste between vim and other programs
set clipboard^=unnamed,unnamedplus             "xclip support
set foldmethod=syntax                           "Enable folding
set foldlevel=99                                "Start with all folds open
set number relativenumber                       "Set line numbers
set showmode showcmd                            "Show mode and keys pressed in normal
set hidden                                      "Allow to leave buffer without saving
set ruler                                       "Show the cursor position all the time
set iskeyword+=-                                "Treat dash separated words as a word text object
set showtabline=2                               "Always show tabs
set updatetime=300                              "Faster completion
set path+=**                                    "Searches current directory recursively.
set splitbelow splitright                       "Open splits to the right and below
set incsearch smartcase ignorecase hlsearch     "Better search
"set scrolljump=-15                              "Jump 15 when moving cursor bellow screen
"set nocompatible
set list title wrap nocursorline mouse=a conceallevel=2
set wildmenu wildmode=longest,list,full wildignorecase  " Autocompletion of commands
"set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smartindent smarttab autoindent "Better tabs
set tabstop=4
let g:rehash256 = 1

" XDG Environment For VIM
" =======================
if empty($XDG_CACHE_HOME)
    let $XDG_CACHE_HOME = $HOME . '/.cache'
endif
" see :help persistent-undo
if !isdirectory($XDG_CACHE_HOME . '/vim/undo')
    call mkdir($XDG_CACHE_HOME . '/vim/undo', 'p')
endif
set undodir=$XDG_CACHE_HOME/vim/undo//,/var/tmp//,/tmp//
set undofile

" check that directories exist
set backupdir=$XDG_CACHE_HOME/vim/backup//,/var/tmp//,/tmp//
if !isdirectory($XDG_CACHE_HOME . '/vim/backup')
    call mkdir($XDG_CACHE_HOME . '/vim/backup', 'p')
endif

" Double slash does not actually work for backupdir, here's a fix
augroup XDGSUPPORT
autocmd BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')
augroup end

if !isdirectory($XDG_CACHE_HOME . '/vim/swap')
    call mkdir($XDG_CACHE_HOME . '/vim/swap', 'p')
endif
set directory=$XDG_CACHE_HOME/vim/swap//,/var/tmp//,/tmp//
" 1}}} "General Settings

" Key Bindings {{{1 "
let g:mapleader = "\<Space>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Open or compile file
map <silent><leader>co :!opout <c-r>%<CR><CR>

" Write To File As Sudo
nnoremap <leader>sudo :w !sudo tee > /dev/null %

" if this is a normal buffer use <CR> to toggle folding
nmap <expr> <CR> &buftype ==# '' ? 'za' : "\<CR>"

" copy all matches with the last seach
nmap ym :YankMatch<CR>
" delete matches
nmap dm :%s/<c-r>///g<CR>
" change matches
nmap cm :%s/<c-r>///g<Left><Left>

"For Proper Tabbing And Bracket Insertion"
inoremap {<CR> {<CR>}<c-o><s-o>
inoremap (<CR> (<CR>)<c-o><s-o>

nnoremap <leader>s :source ~/.vimrc<CR>
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
nnoremap <leader>z :set invrnu invnu<CR>
nnoremap Q <nop>

"Find Files {{{2 "
"Bookmarked directories
nnoremap <leader>fu  :edit ~/documents/university/**/*
nnoremap <leader>fd  :edit ~/Documents/**/*
nnoremap <leader>fv  :edit ~/.vim/**/*
nnoremap <leader>fh  :edit ~/**
" 2}}} "Find Files
" 2}}} " Key Bindings

" Aesthetics: {{{1 "
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

set t_Co=256 background=dark    "Sets 246 color and dark background
syntax enable                   "Enables syntax highlighing
colorscheme spaceway
"colorscheme nvcode
highlight Normal ctermbg=NONE
highlight Conceal ctermbg=NONE

set statusline=
set statusline+=\ %F
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%"
set statusline+=\ %l:%c
set statusline+=\ 
set laststatus=2        "show statusbar

" 1}}} Aesthetics "

" FileType Specific Stuff: {{{1 "
augroup GITCOMMITS
    "Spelling for gitcommits
    autocmd!
    autocmd FileType gitcommit silent call dotvim#WordProcessor()
    autocmd FileType gitcommit startinsert
augroup end

augroup AUTOEXEC
    autocmd!
    autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts.sh
    "Run xrdb whenever Xresources are updated.
    autocmd BufWritePost *Xresources !xrdb ~/.Xresources
augroup end

augroup WRIGHTING
    autocmd!
    autocmd FileType markdown,pandoc nnoremap <buffer> <leader>i :<C-U>call dotvim#ImportScreenShot(function('dotvim#MarkdownScreenShot'),'.eps')
    autocmd FileType dotoo,org nnoremap <buffer> <leader>i       :<C-U>call dotvim#ImportScreenShot(function('dotvim#OrgScreenShot'),'.eps')
    autocmd FileType groff,troff,nroff nnoremap <buffer> <leader>i     :<C-U>call dotvim#ImportScreenShot(function('dotvim#GroffScreenShot'),'.eps')
    "autocmd FileType groff,troff,nroff nnoremap <buffer> <leader>i     :<C-U>call dotvim#ImportScreenShot(function('dotvim#NeatroffScreenShot'),'.eps')
    autocmd BufRead,BufNewFile *.md,*.tex,*.wiki call dotvim#WordProcessor()
    autocmd FileType markdown,pandoc,dotoo,org execute "setlocal dictionary+=". &runtimepath . '/extra/dict/latex_comp.txt'
augroup END
" 1 }}}" FileType Specific Stuff

" Abbreviations: {{{1 "
" Command Alias:  {{{2
function! SetupCommandAlias(from, to)
    exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAlias('W','w')
call SetupCommandAlias("w'",'w')
call SetupCommandAlias('Wq','wq')
call SetupCommandAlias('Q','q')
call SetupCommandAlias('man','Man')
call SetupCommandAlias('git','Git')
call SetupCommandAlias('cp','!cp')
call SetupCommandAlias('mv','!mv')
call SetupCommandAlias('rm','!rm')
call SetupCommandAlias('mkdir','!mkdir')
call SetupCommandAlias('ss','s//g\<Left>\<Left>')
" 2}}} Command Alias

" spelling
iab pyhton python
iab the the
iab because because
iab tf,  Therefore,
iab sin, Sincerely ,<CR>Hadi<SPACE>Ghannoum

" lorem ipsum
iab <expr> lorem system('curl -s http://metaphorpsum.com/paragraphs/1')
" 1}}} "Abbreviations

" Etc {{{1 "
" Local Settings {{{ "2
if filereadable(expand('~/.config/vimlocal'))
    source ~/.config/vimlocal
endif
" 2}}} "Local Settings
"}}} Etc "
" vim:foldmethod=marker:foldlevel=0
