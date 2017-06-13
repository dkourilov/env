set number
set hlsearch
set t_Co=256

set nocompatible
set autoread

set hidden

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
" Needs defined keystrokes in terminal app:
" <Control-Shift-LeftArrow>  == <Control-Shift-a>, <Esc>[65;5u
" <Control-Shift-RightArrow> == <Control-Shift-b>, <Est>[66,5u
if &term =~ '^screen'
    for prefix in ['n', 'v']
        exe prefix . "noremap <Esc>[65;5u :bprevious<CR>"
        exe prefix . "noremap <Esc>[66;5u :bnext<CR>"
    endfor
    for prefix in ['i', 'c', 'o']
        exe prefix . "noremap <Esc>[65;5u <Esc><Esc>:bprevious<CR>"
        exe prefix . "noremap <Esc>[66;5u <Esc><Esc>:bnext<CR>"
    endfor
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

" indentLine
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239

" Unbind shift+arrows in all modes
for prefix in ['i', 'n', 'v', 'o', 'c']
    for key in ['<Esc>[67;5u', '<Esc>[68;5u']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor
