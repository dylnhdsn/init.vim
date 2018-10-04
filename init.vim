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

Plug 'alexlafroscia/postcss-syntax.vim'

Plug 'gcmt/taboo.vim'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'

" syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""
Plug 'neomake/neomake'
" config
let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_javascript_eslint_maker
autocmd BufWritePost,BufEnter * Neomake

Plug 'pangloss/vim-javascript'
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END


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

" file browsing
""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-vinegar'

" autocomplete
""""""""""""""""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<c-n>" " Make the tabing on completion menu go from top to bottom
"let g:SuperTabClosePreviewOnPopupClose = 1 " Close the preview when completion ends
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ deoplete#mappings#manual_complete()
"function! s:check_back_space() abort "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

" Make <CR> smart
"let g:ulti_expand_res = 0
"function! Ulti_ExpandOrEnter()
"  " First try to expand a snippet
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res
"    " if successful, just return
"    return ''
"  elseif pumvisible()
"    " if in completion menu - just close it and leave the cursor at the
"    " end of the completion
"    return deoplete#mappings#close_popup()
"  else
"    " otherwise, just do an "enter"
"    return "\<return>"
"  endif
"endfunction
"inoremap <enter> <C-R>=Ulti_ExpandOrEnter()<CR>

" Enable tabbing and shift-tabbing through list of results
"function! g:SmartShiftTab()
"  if pumvisible()
"    return SuperTab("n")
"  else
"    call UltiSnips#JumpForwards()
"    if g:ulti_jump_forwards_res == 0
"      return SuperTab("n")
"    endif
"    return ''
"  endif
"endfunction
"
"function! g:SmartTab()
"  if pumvisible()
"    return SuperTab("p")
"  else
"    call UltiSnips#JumpBackwards()
"    if g:ulti_jump_backwards_res == 0
"      return SuperTab("p")
"    endif
"    return ''
"  endif
"endfunction
"inoremap <silent> <s-tab> <C-R>=g:SmartTab()<cr>
"snoremap <silent> <s-tab> <Esc>:call g:SmartTab()<cr>
"inoremap <silent> <tab> <C-R>=g:SmartShiftTab()<cr>
"snoremap <silent> <tab> <Esc>:call g:SmartShiftTab()<cr>

" terminal
""""""""""""""""""""""""""""""""""""""""""""
Plug 'kassio/neoterm'

" close brackets
""""""""""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'

" syntax
Plug 'sheerun/vim-polyglot'

" html
Plug 'alvan/vim-closetag'

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

" t nav
" tnoremap <esc><esc> <c-\><c-n><c-w><c-p>

" Window split settings
highlight TermCursor ctermfg=red guifg=red
set splitbelow
set splitright

" Terminal settings
" splits
nnoremap <silent>ss :split<cr>
nnoremap <silent>vv :vsplit<cr>

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

" workspace

" Workspace Setup
" ----------------
function! DefaultWorkspace()
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()



" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
"func! s:mapMoveToWindowInDirection(direction)
"  func! s:maybeInsertMode(direction)
"    stopinsert
"    execute "wincmd" a:direction
"
"    if &buftype == 'terminal'
"      startinsert!
"    endif
"  endfunc
"
"  execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
"        \ "<C-\\><C-n>"
"        \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
"  execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
"        \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
"endfunc
"for dir in ["h", "j", "l", "k"]
"  call s:mapMoveToWindowInDirection(dir)
"endfor

" visor style terminal buffer
let s:visorbuff = 0
function! VisorBuff()
  topleft 30 split
  try
    exe 'buffer' . s:visorbuff
    startinsert
  catch
    terminal
    let s:visorbuff=bufnr('%')
    start
    tnoremap <buffer> <c-t> <C-\><C-n>:close<cr>
  endtry
endfunction

com! VisorBuff call VisorBuff()
nnoremap <c-t> :VisorBuff<cr>
