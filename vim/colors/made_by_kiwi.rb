bg         = '161616'
light_bg   = '202020'
white      = 'ffffff'
black      = '000000'
light_grey = 'a6a6a6'
dark_grey  = '5e5e5e'
green      = '69cf22'
dark_green = '3b7005'
orange     = 'e57300'
red        = 'df3d2a'
purple     = '8c61ce'
blue       = '43a7eb'

highlight  = '1a3d5a'

vim_colors "kiwi" do
  author "Zef Houssney"
  # notes  "My really sweet theme"

  reset      true
  background :dark

  Normal     light_grey, bg
  Todo       light_grey, bg

  
  Visual nil, highlight
  # link :FoldColumn, :Todo, :to => :Normal
  
  
  Comment dark_grey, :gui => 'NONE'
  MatchParen red, bg

  String green
 
  Title white, :gui => 'bold'

  Function white
  StorageClass light_grey

  Constant red 
  PreProc  red

  # Special white 
  Special dark_green
  
  Type blue, :gui => 'NONE'
  
  Number red
  
  Conditional orange
  Define      orange
  Identifier  orange
  Keyword     orange
  Operator    orange
  Statement   orange, :gui => 'NONE'
  Include     orange

  # Vim UI
	Cursor     nil, green
	CursorLine nil, highlight
  LineNr     dark_grey
  NonText    dark_grey
	Folded 		 dark_grey, black
  FoldColumn dark_grey, bg
  VertSplit bg, dark_grey

  StatusLine white, light_bg, :gui => 'NONE'
  StatusLineNC light_bg, light_grey
  WildMenu blue, light_bg

  Pmenu blue, light_bg
  PmenuSel red, light_bg
  PmenuSbar white, white
  PmenuThumb red, red

  # Vim scripts
  

  # help
  helpOption blue, :gui => 'NONE'
  helpNote dark_grey, :gui => 'italic'
  helpSectionDelim red


  # ruby
  rubyClass   orange
  rubyBlock   orange
  rubyControl orange

  rubyRailsMethod red
  rubyRailsRenderMethod red

  rubyRailsUserClass   blue
  rubyInstanceVariable blue 
  rubyClassVariable    blue 
  
  rubyMethodDeclaration white
  rubyFunction white

  rubyStringDelimiter green
  rubyInterpolationDelimiter dark_grey
  
  rubySymbol purple

  # HTML
  htmlTitle light_grey
  htmlTag            dark_green 
  htmlArg            dark_green 
  htmlTagName        dark_green 
  htmlEndTag         dark_green 
  htmlSpecialTagName dark_green 
  htmlSpecialChar    red
  htmlLink           blue, :gui => 'NONE'

  # CSS
  cssIdentifier dark_green
  cssClassName  dark_green
  cssTagName orange, :gui => 'NONE'
  
  cssPseudoClass   blue
  cssPseudoClassId blue
  # cssDefinition white
#  cssFontProp   white
#  cssBoxProp    white
#  cssTextProp   white
#  cssTableProp  white
#  cssRenderProp white
#  cssColorProp  white
#  cssGeneratedContentProp white

  # SASS
  sassId         dark_green
  sassIdChar     dark_green
  sassClass      dark_green
  sassClassChar  dark_green

  sassMixin     white
  sassMixing    white
  sassMixinName white

  # Coffeescript
  # based on https://github.com/kchmck/vim-coffee-script
  coffeeAssignment light_grey
  coffeeAssignmentChar orange
	coffeeAssignmentMod  orange
  coffeeInterpDelim dark_grey

  # JavaScript
  javaScriptNumber red

  # textile
  txtHeader  white, :gui => 'bold'
  txtHeader2 white, :gui => 'bold'
  txtHeader3 white, :gui => 'bold'

  # NERDtree
  NERDTreePart dark_grey
  NERDTreePartFile blue
  NERDTreeOpenable blue
  NERDTreeClosable blue
  NERDTreeUp       blue
  NERDTreeDir purple
  NERDTreeDirSlash dark_grey
  NERDTreeFile white
  NERDTreeExecFile red

  # XML
  xmlTag orange
  xmlTagName orange
  xmlEndTag orange

end

