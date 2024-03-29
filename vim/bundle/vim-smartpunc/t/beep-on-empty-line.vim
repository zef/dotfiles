runtime! plugin/smartpunc.vim

call vspec#hint({'scope': 'smartpunc#scope()', 'sid': 'smartpunc#sid()'})
set backspace=indent,eol,start

describe 'smartpunc#map_to_trigger'
  before
    SaveContext
    new

    " If the cursor will be moved to an empty line...
    call smartpunc#define_rule({
    \   'at': '(\%#)',
    \   'char': '<Return>',
    \   'input': '<Return>X<Return>)<BS><Up><C-o>$<BS>',
    \ })
    call smartpunc#map_to_trigger('i', '<buffer> <Return>', '<Return>')
  end

  after
    close!
    ResetContext
  end

  it 'should not beep if the cursor will be moved to an empty line'
    " 'let foo = (#)'
    call setline(1, 'let foo = ()')
    normal! gg$
    Expect getline(1, line('$')) ==# ['let foo = ()']
    Expect [line('.'), col('.')] ==# [1, 12]

    " 'let foo = ('
    " '#'
    " ')'
    execute 'normal' "i\<Return>"
    Expect getline(1, line('$')) ==# ['let foo = (',
    \                                 '',
    \                                 ')']
    Expect [line('.'), col('.')] ==# [2, 1]
  end
end
