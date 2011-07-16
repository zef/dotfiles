" Vim color file
" Converted from Textmate theme Made by Kiwi using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "kiwi-old"

hi Visual  guifg=NONE guibg=#143456 gui=NONE
hi CursorLine  guifg=NONE guibg=#0e0e0e gui=NONE
hi CursorColumn  guifg=NONE guibg=#0e0e0e gui=NONE
hi LineNr  guifg=#5e5e5e guibg=#161616 gui=NONE
hi StatusLine  guifg=#ffffff guibg=#313131 gui=none
hi StatusLineNC  guifg=#a6a6a6 guibg=#313131 gui=NONE
hi VertSplit  guifg=#313131 guibg=NONE gui=NONE
hi MatchParen  guifg=#e57300 guibg=NONE gui=NONE
hi Pmenu  guifg=#4ca2ed guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#143456 gui=NONE
hi IncSearch  guifg=NONE guibg=#273E56 gui=NONE
hi Search  guifg=NONE guibg=#273E56 gui=NONE
hi Directory  guifg=#8c61ce guibg=NONE gui=NONE
hi Folded  guifg=#484848 guibg=#161616 gui=NONE
hi FoldColumn guifg=NONE guibg=NONE gui=NONE

hi Normal  guifg=#a6a6a6 guibg=#161616 gui=NONE
hi Boolean  guifg=#8c61ce guibg=NONE gui=NONE
hi Character  guifg=#8c61ce guibg=NONE gui=NONE
hi Comment  guifg=#484848 guibg=NONE gui=italic
hi Conditional  guifg=#e57300 guibg=NONE gui=NONE
hi Constant  guifg=#8c61ce guibg=NONE gui=NONE
hi Define  guifg=#e57300 guibg=NONE gui=NONE
hi ErrorMsg  guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg  guifg=#ffffff guibg=#990000 gui=NONE
hi Float  guifg=#69cf22 guibg=NONE gui=NONE
hi Function  guifg=#ffffff guibg=NONE gui=NONE
hi Identifier  guifg=#e57300 guibg=NONE gui=NONE
hi Keyword  guifg=#e57300 guibg=NONE gui=NONE
hi Label  guifg=#69cf22 guibg=NONE gui=NONE
hi String  guifg=#69cf22 guibg=NONE gui=NONE
hi Number  guifg=#69cf22 guibg=NONE gui=NONE
hi NonText  guifg=#a162c7 guibg=#0e0e0e gui=NONE
hi Operator  guifg=#e57300 guibg=NONE gui=NONE
hi PreProc  guifg=#e57300 guibg=NONE gui=NONE
hi Special  guifg=#a6a6a6 guibg=NONE gui=NONE
hi SpecialKey  guifg=#a162c7 guibg=#0e0e0e gui=NONE
hi Statement  guifg=#e57300 guibg=NONE gui=NONE
hi StorageClass  guifg=#e57300 guibg=NONE gui=NONE
hi Tag  guifg=#3b7005 guibg=NONE gui=NONE
hi Title  guifg=#a6a6a6 guibg=NONE gui=NONE
hi Todo  guifg=#484848 guibg=NONE gui=bold,italic
hi Type  guifg=#4ca2ed guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#e57300 guibg=NONE gui=NONE
hi rubyFunction  guifg=#ffffff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#8c61ce guibg=NONE gui=NONE
hi rubyConstant  guifg=NONE guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#69cf22 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#43a7eb guibg=NONE gui=NONE
hi rubyInclude  guifg=#e57300 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#43a7eb guibg=NONE gui=NONE
hi rubyRegexp  guifg=#69cf22 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#69cf22 guibg=NONE gui=NONE
hi rubyEscape  guifg=#7b7b7b guibg=NONE gui=NONE
hi rubyControl  guifg=#e57300 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#e57300 guibg=NONE gui=NONE
hi rubyException  guifg=#e57300 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#43a7eb guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#df3d2a guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#df3d2a guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#df3d2a guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#df3d2a guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#484848 guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#df3d2a guibg=NONE gui=NONE
hi htmlTag  guifg=#3b7005 guibg=NONE gui=NONE
hi htmlEndTag  guifg=#3b7005 guibg=NONE gui=NONE
hi htmlTagName  guifg=#3b7005 guibg=NONE gui=NONE
hi htmlArg  guifg=#3b7005 guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#8c61ce guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#e57300 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#df3d2a guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#3b7005 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#43a7eb guibg=NONE gui=NONE
hi yamlAlias  guifg=#43a7eb guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#69cf22 guibg=NONE gui=NONE
hi cssURL  guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName  guifg=#df3d2a guibg=NONE gui=NONE
hi cssColor  guifg=#8c61ce guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#3b7005 guibg=NONE gui=NONE
hi cssClassName  guifg=#3b7005 guibg=NONE gui=NONE
hi cssValueLength  guifg=#69cf22 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#8c61ce guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE


