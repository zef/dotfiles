Vim
---

- I'd like to find or write a plugin that deals with moving args around... could
  actually be quite tricky to implement.

    " Move an item forward in a list
    nmap <Leader>a df,"_xf,i <esc>p


- The following seems interesting... I'd like to play with it at some point
  found around line 1230 here: https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc

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


