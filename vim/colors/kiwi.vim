" Vim color file
"   This file was generated by Palette
"   http://rubygems.org/gems/palette
"
" Author: Zef Houssney

hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name="kiwi"

if has("gui_running")
    set background=dark
endif

hi Normal                     guifg=#A6A6A6 ctermfg=248  guibg=#161616 ctermbg=233  gui=NONE cterm=NONE
hi Todo                       guifg=#A6A6A6 ctermfg=248  guibg=#161616 ctermbg=233  gui=NONE cterm=NONE
hi SignColumn                 guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi Visual                     guibg=#1A3D5A ctermbg=23   gui=NONE cterm=NONE
hi Comment                    guifg=#5E5E5E ctermfg=59   gui=NONE cterm=NONE
hi MatchParen                 guifg=#DF3D2A ctermfg=166  guibg=#161616 ctermbg=233  gui=NONE cterm=NONE
hi String                     guifg=#69CF22 ctermfg=76   gui=NONE cterm=NONE
hi Title                      guifg=#FFFFFF ctermfg=231  gui=BOLD cterm=BOLD
hi Function                   guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi StorageClass               guifg=#A6A6A6 ctermfg=248  gui=NONE cterm=NONE
hi Constant                   guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi PreProc                    guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi Special                    guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi Type                       guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi Number                     guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi Conditional                guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi Define                     guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi Identifier                 guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi Keyword                    guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi Operator                   guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi Statement                  guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi Include                    guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi Cursor                     guibg=#69CF22 ctermbg=76   gui=NONE cterm=NONE
hi CursorLine                 guibg=#202020 ctermbg=234  gui=NONE cterm=NONE
hi CursorColumn               guibg=#202020 ctermbg=234  gui=NONE cterm=NONE
hi LineNr                     guifg=#5E5E5E ctermfg=59   gui=NONE cterm=NONE
hi NonText                    guifg=#5E5E5E ctermfg=59   gui=NONE cterm=NONE
hi Folded                     guifg=#5E5E5E ctermfg=59   guibg=#000000 ctermbg=16   gui=NONE cterm=NONE
hi FoldColumn                 guifg=#5E5E5E ctermfg=59   guibg=#161616 ctermbg=233  gui=NONE cterm=NONE
hi VertSplit                  guifg=#5E5E5E ctermfg=59   guibg=#161616 ctermbg=233  gui=NONE cterm=NONE
hi StatusLine                 guifg=#FFFFFF ctermfg=231  guibg=#202020 ctermbg=234  gui=NONE cterm=NONE
hi StatusLineNC               guifg=#A6A6A6 ctermfg=248  guibg=#202020 ctermbg=234  gui=NONE cterm=NONE
hi WildMenu                   guifg=#43A7EB ctermfg=74   guibg=#202020 ctermbg=234  gui=NONE cterm=NONE
hi Pmenu                      guifg=#43A7EB ctermfg=74   guibg=#202020 ctermbg=234  gui=NONE cterm=NONE
hi PmenuSel                   guifg=#DF3D2A ctermfg=166  guibg=#202020 ctermbg=234  gui=NONE cterm=NONE
hi PmenuSbar                  guifg=#FFFFFF ctermfg=231  guibg=#FFFFFF ctermbg=231  gui=NONE cterm=NONE
hi PmenuThumb                 guifg=#DF3D2A ctermfg=166  guibg=#DF3D2A ctermbg=166  gui=NONE cterm=NONE
hi helpOption                 guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi helpNote                   guifg=#5E5E5E ctermfg=59   gui=ITALIC cterm=NONE
hi helpSectionDelim           guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi rubyClass                  guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi rubyBlock                  guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi rubyControl                guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi rubyRailsMethod            guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi rubyRailsRenderMethod      guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi rubyRailsUserClass         guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi rubyInstanceVariable       guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi rubyClassVariable          guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi rubyMethodDeclaration      guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi rubyFunction               guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi rubyStringDelimiter        guifg=#69CF22 ctermfg=76   gui=NONE cterm=NONE
hi rubyInterpolationDelimiter guifg=#5E5E5E ctermfg=59   gui=NONE cterm=NONE
hi rubySymbol                 guifg=#8C61CE ctermfg=98   gui=NONE cterm=NONE
hi htmlTitle                  guifg=#A6A6A6 ctermfg=248  gui=NONE cterm=NONE
hi htmlTag                    guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi htmlArg                    guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi htmlTagName                guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi htmlEndTag                 guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi htmlSpecialTagName         guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi htmlSpecialChar            guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi htmlLink                   guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi cssIdentifier              guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi cssClassName               guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi cssTagName                 guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi cssPseudoClass             guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi cssPseudoClassId           guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi sassId                     guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi sassIdChar                 guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi sassClass                  guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi sassClassChar              guifg=#3B7005 ctermfg=58   gui=NONE cterm=NONE
hi sassMixin                  guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi sassMixing                 guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi sassMixinName              guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi coffeeAssignment           guifg=#A6A6A6 ctermfg=248  gui=NONE cterm=NONE
hi coffeeAssignmentChar       guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi coffeeAssignmentMod        guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi coffeeInterpDelim          guifg=#5E5E5E ctermfg=59   gui=NONE cterm=NONE
hi javaScriptNumber           guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi txtHeader                  guifg=#FFFFFF ctermfg=231  gui=BOLD cterm=BOLD
hi txtHeader2                 guifg=#FFFFFF ctermfg=231  gui=BOLD cterm=BOLD
hi txtHeader3                 guifg=#FFFFFF ctermfg=231  gui=BOLD cterm=BOLD
hi NERDTreePart               guifg=#5E5E5E ctermfg=59   gui=NONE cterm=NONE
hi NERDTreePartFile           guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi NERDTreeOpenable           guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi NERDTreeClosable           guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi NERDTreeUp                 guifg=#43A7EB ctermfg=74   gui=NONE cterm=NONE
hi NERDTreeDir                guifg=#8C61CE ctermfg=98   gui=NONE cterm=NONE
hi NERDTreeDirSlash           guifg=#5E5E5E ctermfg=59   gui=NONE cterm=NONE
hi NERDTreeFile               guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi NERDTreeExecFile           guifg=#DF3D2A ctermfg=166  gui=NONE cterm=NONE
hi xmlTag                     guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi xmlTagName                 guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE
hi xmlEndTag                  guifg=#E57300 ctermfg=166  gui=NONE cterm=NONE

