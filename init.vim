"
" ██╗  ██╗██████╗ ███████╗███╗   ██╗
" ██║  ██║██╔══██╗██╔════╝████╗  ██║
" ███████║██║  ██║███████╗██╔██╗ ██║
" ██╔══██║██║  ██║╚════██║██║╚██╗██║
" ██║  ██║██████╔╝███████║██║ ╚████║
" ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝
"

let mapleader=','

"//////////////////////////////////////////
"// plugins
"//////////////////////////////////////////

call plug#begin('~/.local/share/nvim/plugged')

" - to file browse
Plug 'tpope/vim-vinegar'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" completion
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" linting
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" colorscheme
""""""""""""""""""""""""""""""""""""""""""""
Plug 'flazz/vim-colorschemes'

" powerline thing
""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
" config
let g:airline_powerline_fonts = 1

" fuzzy search
""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" config
let g:fzf_command_prefix = 'FZF'
let g:fzf_layout  = { 'down': '6' }
" mappings
nnoremap <leader>t :FZF<cr>
nnoremap <leader>b :FZFBuffers<cr>

Plug 'numkil/ag.nvim'

call plug#end()

"//////////////////////////////////////////
" config
"//////////////////////////////////////////

syntax on                       "turn on syntax highlighting
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set hidden

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/history > /dev/null 2>&1
  set undodir=~/.config/nvim/history
  set undofile
endif

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch       " Find the next match as we type the search
set hlsearch        " Hilight searches by default
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Cursor
set cursorline
set virtualedit=all

"//////////////////////////////////////////
" ui
"//////////////////////////////////////////

colorscheme gruvbox
set background=dark
set fillchars+=vert:\ 

"//////////////////////////////////////////
" binds
"//////////////////////////////////////////

" splits
nnoremap <silent>ss :split<cr>
nnoremap <silent>vv :vsplit<cr>

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy


" navigation
""""""""""""""""""""""""""""""""""""""""""""

" n nav
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" command
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>


"//////////////////////////////////////////
" functions
"//////////////////////////////////////////

" Strip trailing whitespace
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
nnoremap ,w :StripTrailingWhitespaces<CR>
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
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

" Use Q to intelligently close a window
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if matchstr(expand("%"), 'term') == 'term'
    wincmd c
  else
    bdelete
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
