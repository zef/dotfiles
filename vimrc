set nocompatible

" I type in Dvorak, this is right next to return and quite convenient.
let mapleader = '-'
command Config e ~/.vimrc

filetype plugin indent on
execute pathogen#infect()

colorscheme kiwi
set guifont=Menlo:h16
set foldcolumn=1
set numberwidth=1
" set number

set listchars=tab:▸\ ,eol:¬
set ts=2 sts=2 sw=2 expandtab
set formatoptions=cqj

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
set spelllang=en_us

" edit new line above/below from insert mode
inoremap <D-CR> <esc>o
inoremap <S-CR> <esc>O

nnoremap <leader>d o<C-R>=strftime("%Y-%m-%d ")<CR>


" directional window movements in one action
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Move lines up and down with help from Unimpaired
nmap <D-u> [e
nmap <D-d> ]e
vmap <D-u> [egv
vmap <D-d> ]egv
imap <D-u> <esc>[ea
imap <D-d> <esc>]ea

" execute the selection and replace with result
vnoremap <Leader>= c<C-r>=<C-r>"<CR>

" super custom relpace UIColor with literal
" nnoremap <Leader>c cw#colorLiteral<esc>f:llvt,c<C-r>=<C-r>"<CR><esc>f:llvt,c<C-r>=<C-r>"<CR><esc>f:llvt,c<C-r>=<C-r>"<CR><esc>

" duplicate line or selection
nmap <D-D> yyp
imap <D-D> <esc>yypgi<esc>ja
vmap <D-D> yPgv<esc>

" TextMate-like indent/outdent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
imap <D-[> <esc><<gi<esc>hi
imap <D-]> <esc>>>gi<esc>lla

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" keep pasted text in buffer when pasting in visual mode
xnoremap <leader>p "_dP

" Search and replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" Search and replace visual selection
vnoremap <Leader>r y:%s/<C-r>"//g<Left><Left>

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

" Rename current file (thanks Gary Bernhardt)
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>rn :call RenameFile()<cr>

" Remove smart quotes
command! -bar -range=% DumbQuotes :<line1>,<line2>s/[“”]/\"/ge|<line1>,<line2>s/’/'/ge

command! FormatJSON %!jq '.'

""""""""""" Plugin configuration

nmap <D-/> gcc
vmap <D-/> gc

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
let NERDTreeIgnore=['\.jpg$', '\.jpeg$', '\.png$']


" Reveal file in Finder (Command-Option-Shift-r)
map <D-‰> :!open -R '%'<CR><CR>

map <Leader>gg :call ToggleGitGutter()<CR>
map <Leader>hh :call HexHighlight()<CR>
map <Leader>cc :set cursorcolumn<CR>

" Sparkup is fantastic! https://github.com/rstacruz/sparkup
let g:sparkupNextMapping = '<c-j>'

let g:CommandTMaxHeight = 14
let g:CommandTMinHeight = 14


" might try this sometime, but not right now
let g:vim_markdown_folding_disabled = 1

" get rid of annoying `o` behavior
let g:vim_markdown_new_list_item_indent = 0

" call AddCycleGroup(['one', 'two', 'three'])

""""""""""""""""""""""""""""""""

" See /Applications/MacVim.app/Contents/Resources/vim/gvimrc
" makes shift selection possible in insert mode
if has("gui_macvim")
	nmap <SwipeLeft> gT
	nmap <SwipeRight> gt

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " include rL for scrollbars
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

" function! FormatBySentence(start, end)
"     silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
" endfunction


" Tabularize when typing |, only used in markdown
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text
  autocmd BufNewFile,BufRead Podfile.lock setfiletype yaml

  autocmd Filetype swift setlocal ts=2 sts=2 sw=2

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    autocmd FileType text,markdown setlocal textwidth=80
    " autocmd FileType text,markdown set formatexpr=MarkdownSentenceFormat()
    " autocmd FileType markdown set formatexpr=FormatBySentence(v:lnum,v:lnum+v:count-1)
    autocmd FileType markdown inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

    " leader b for bold in markdown
    autocmd FileType markdown vmap <leader>b S*gvS*

    " leader i for inserting an image in markdown, with cursor over image URL
    autocmd FileType markdown nmap <leader>i yss)I![

    " leader l (in visual mode ) for formatting selected text as link text,
    " and allowing a URL to be entered
    autocmd FileType markdown vmap <leader>l S]f]a(

    " leader l for formatting text and a link into proper link (in a list)
    "     Some text here https://whatever.com
    "     - [Some text here](https://whatever.com)
    autocmd FileType markdown nmap <leader>l 0v/httpBES]nsiW)dT]I- j0
    "
    " leader f for adding a footnote after the cursor
    autocmd FileType markdown nmap <leader>f a[1](#footnotesF1
    "
    " leader h for adding a --- header
    autocmd FileType markdown nmap <leader>h I---<Esc>


    " autocmd FileType html setlocal equalprg=tidy\ -q\ -i\ --show-body-only\ yes

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
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    " Save existing files automatically
    " ignore warnings about new unsaved files
    " autocmd FocusLost * :call <SID>StripTrailingWhitespaces()
    autocmd FocusLost * silent! :wa

  augroup END

else
  set autoindent    " always set autoindenting on
endif " has("autocmd")

