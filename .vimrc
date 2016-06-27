set number
set hlsearch
set t_Co=256

set nocompatible
set autoread

filetype indent plugin on

set wildmenu
set backspace=indent,eol,start
set autoindent
set nostartofline

" wrap navigation at the EOL in insert and other modes
set ww=h,l,<,>,[,]

" set list! to show special chars
set list lcs=eol:¬,tab:❭\─,trail:·

set showcmd " show incomplete command (learning)

set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set expandtab
set nostartofline

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set novisualbell
set t_vb=

set si
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set laststatus=2
set mouse=a

set clipboard=unnamed

" iterm2: change cursor shape on insert/normal
if exists('$TMUX')
    " @see https://gist.github.com/andyfowler/1195581
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Switch buffers <Control-Shift-Arrow>
if &term =~ '^screen'
    " needs to be defined in terminal key bindings
    nnoremap <Esc>[65;5u :bprevious<CR>
    nnoremap <Esc>[66;5u :bnext<CR>
endif

syntax on

let g:sierra_Campfire = 1
colorscheme sierra

execute pathogen#infect()
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:promptline_theme = 'airline'

" brew install clipper
" vnoremap y :call system('nc localhost 8377', @")<CR>

" rainbow_parentheses.eim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" gitgutter.vim
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" airline.vim
