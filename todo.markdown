Vim
---

I'd like to find or write a plugin that deals with moving args around...
could actually be quite tricky to implement.

Look at: https://github.com/garybernhardt/dotfiles

Look at gundo, start using undo trees.

Use control-o to go back in movements

```vim
" Move an item forward in a list
nmap <Leader>a df,"_xf,i <esc>p
```

The following seems interesting... I'd like to play with it at some point.
Found around line 1230 [here](https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc).

```vim
" Motion for "next/last object". For example, "din(" would go to the next "()"
" pair and delete its contents.

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
```


Git
---

Maybe incorporate some stuff for dealing with git branches?

```
git branch --merged | grep -v develop | grep -v master | xargs git branch -d
git branch --remote --merged | grep -v develop | grep -v master | sed -e 's/origin\//:/' | xargs -n 1 git push origin
git remote update origin —prune
```




