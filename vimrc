set nocompatible

" I type in Dvorak, this is right next to return and quite convenient.
let mapleader = '-'
command Config e ~/.vimrc

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

colorscheme kiwi
set guifont=Menlo:h12
set foldcolumn=1
set numberwidth=1
set number

set listchars=tab:▸\ ,eol:¬
set ts=2 sts=2 sw=2 expandtab
set formatoptions=cq

set wildmenu
set showmode
set showcmd
set autoindent
set ignorecase
set smartcase
set nowrap
set linebreak
set autoread
set scrolloff=5

" edit new line above/below from insert mode
inoremap <D-CR> <esc>o
inoremap <S-CR> <esc>O

" directional window movements in one action
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Move lines up and down single lines with help from Unimpaired
nmap <D-Up> [e
nmap <D-Down> ]e
vmap <D-Up> [egv
vmap <D-Down> ]egv
imap <D-Up> <esc>[ea
imap <D-Down> <esc>]ea

" TextMate-like indent/outdent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
imap <D-[> <esc><<gi<esc>hi
imap <D-]> <esc>>>gi<esc>lla

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Search and replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" Ack project for word under cursor (Command-Option-Shift-f)
nnoremap <D-Ï> :Ack <C-r><C-w><CR>

" Allow holding command to move directionally on lines with soft line breaks
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Change inside quotes with Cmd-" and Cmd-'
nnoremap <D-'> ci'
nnoremap <D-"> ci"
inoremap <D-'> <esc>ci'
inoremap <D-"> <esc>ci"

" TODO - I'd like to find a plugin that deals with moving args around... could
" be quite tricky actually.
" Move an item forward in a list
" nmap <Leader>a df,"_xf,i <esc>p

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Don't move on *
nnoremap * *<c-o>

" Sudo to write when you opened the file without sudo
cnoremap w!! w !sudo tee % >/dev/null

" Convert range or entire buffer to Ruby 1.9 hash syntax
" https://github.com/hashrocket/dotmatrix/commit/6c77175adc19e94594e8f2d6ec29371f5539ceeb
command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

" wrap with html link
vmap <c-l> sta href=""<CR>f"a

" Reveal file in Finder (Command-Option-Shift-r)
map <D-‰> :!open -R '%'<CR><CR>


" The following seems interesting... I'd like to play with it at some point
" found around line 1230 here: https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc

" " Motion for "next/last object". For example, "din(" would go to the next "()"
" " pair and delete its contents.
"
" onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
" xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
" onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
" xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
"
" onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
" xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
"
" function! s:NextTextObject(motion, dir)
"   let c = nr2char(getchar())
"
"   if c ==# "b"
"       let c = "("
"   elseif c ==# "B"
"       let c = "{"
"   elseif c ==# "d"
"       let c = "["
"   endif
"
"   exe "normal! ".a:dir.c."v".a:motion.c
" endfunction


""""""""""" Plugin configuration
map <Leader>y :YRShow<CR>
let g:yankring_history_file = '.yankring_history'
let g:yankring_ignore_duplicate = 0
let g:yankring_window_use_horiz = 0  " Use vertical split
let g:yankring_window_use_right = 0
let g:yankring_window_width     = 40 " then press space to toggle expanded window
let g:yankring_zap_keys         = '' " I don't want yankring slowing me down by asking questions...

" I use surround way more than substitute...
nmap s <Plug>Ysurround
nmap S <Plug>YSurround
nmap ss <Plug>Yssurround
nmap SS <Plug>YSsurround

" add mapping of 'i' to ruby/coffeescript style string interpolation
let g:surround_105  = "#{\r}" " 105 is the ASCII mapping for i

map <Leader>n :NERDTreeToggle<CR>
map <D-R> :NERDTreeFind<CR>
let NERDTreeDirArrows = 1

" might want to make this maintain selection in visual mode
map <D-/> :TComment<CR>
" Ideally this would find the cursor position before and after, and adjust for
" the movement, I'll assume that it's at least 2 charachters though for now.
inoremap <D-/> <esc>:TComment<CR>2la

" Sparkup is fantastic! https://github.com/rstacruz/sparkup
let g:sparkupNextMapping = '<c-j>'
""""""""""""""""""""""""""""""""

" function! CleanHTML()
"   return substitute('%', "’", "'", 'g')
"   “
"   ”
" endfunction

" See /Applications/MacVim.app/Contents/Resources/vim/gvimrc
" makes shift selection possible in insert mode
if has("gui_macvim")
	nmap <SwipeLeft> gT
	nmap <SwipeRight> gt

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " include rL for scrollbars, trying it out without for now...
  set guioptions=aAegmt

  let macvim_hig_shift_movement = 1

  " This was getting in the way of some of my mappings, I could not override
  " them without manually sourcing $MYVIMRC
  let macvim_skip_cmd_opt_movement = 1
endif

nnoremap <esc> :noh<return><esc>

set backupdir=~/.vimbackups
set directory=~/tmp,/var/tmp,/tmp

" http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! <SID>StripTrailingWhitespaces()
  call Preserve("%s/\\s\\+$//e")
endfunction

" remove trailing whitespace
nmap _$ :call <SID>StripTrailingWhitespaces()<CR>
" fix indentation for entire file
nmap _= :call Preserve("normal gg=G")<CR>

" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" see http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

set spelllang=en_us

" required for ruby blocks as text-objects
runtime macros/matchit.vim
""""""""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set incsearch   " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

    " autocmd! BufWritePost .vimrc source $MYVIMRC

    " remove trailing whitespace on save
    autocmd BufWritePre *.sass,*.scss,*.css,*.erb,*.rb,*.js,*.coffee,*.h,*.m,*.vim :call <SID>StripTrailingWhitespaces()

  augroup END

else
  set autoindent    " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

