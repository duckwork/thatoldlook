" ----
" File: thatoldlook.vim
" Description: a minimal colorscheme for vim based on
"              That Old Look by syork on colourlovers
" Author: Case Duckworth
" Version: 1.0
" Last Modified: 2016-02-20
" ----

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "thatoldlook"
let s:is_dark = (&background == 'dark')

" Palette
let s:c = {}

let s:c.black          = ['#584c46', 0]
let s:c.red            = ['#da825f', 1]
let s:c.green          = ['#73c064', 2]
let s:c.yellow         = ['#d6b51f', 3]
let s:c.blue           = ['#5091b2', 4]
let s:c.magenta        = ['#ce7198', 5]
let s:c.cyan           = ['#8eb2a4', 6]
let s:c.gray1          = ['#7f7664', 7]

let s:c.gray2          = ['#a89c84', 8]
let s:c.red_bright     = ['#f26730', 9]
let s:c.green_bright   = ['#beeb34', 10]
let s:c.yellow_bright  = ['#e59606', 11]
let s:c.blue_bright    = ['#21aabd', 12]
let s:c.magenta_bright = ['#f2488f', 13]
let s:c.cyan_bright    = ['#8eedc7', 14]
let s:c.white          = ['#f8ecc2', 15]

if s:is_dark
  let s:fg       = s:c.white
  let s:bg       = s:c.black
  let s:h        = s:c.gray1
  let s:hh       = s:c.gray2
  let s:red     = s:c.red
  let s:green   = s:c.green
  let s:yellow  = s:c.yellow
  let s:blue    = s:c.blue
  let s:magenta = s:c.magenta
  let s:cyan    = s:c.cyan
else
  let s:fg       = s:c.black
  let s:bg       = s:c.white
  let s:h        = s:c.gray2
  let s:hh       = s:c.gray1

  let s:red     = s:c.red_bright
  let s:green   = s:c.green_bright
  let s:yellow  = s:c.yellow_bright
  let s:blue    = s:c.blue_bright
  let s:magenta = s:c.magenta
  let s:cyan    = s:c.cyan_bright
endif

let s:bold      = 'bold,'
let s:italic    = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse   = 'inverse,'

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none   = ['NONE', 'NONE']

function! s:HL(group, fg, ...)
  " Args: group, fg, bg, attrib, special
  let fg = a:fg
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = ['hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" Vim Highlight Groups
call s:HL('ColorColumn',  s:none,    s:hh)
call s:HL('Cursor',       s:h,       s:none, s:inverse)
call s:HL('CursorColumn', s:hh,      s:none, s:inverse)
call s:HL('CursorLine',   s:none)
call s:HL('CursorLineNr', s:fg,      s:none, s:italic)
call s:HL('DiffAdd',      s:green,   s:none, s:inverse)
call s:HL('DiffChange',   s:cyan,    s:none, s:inverse)
call s:HL('DiffDelete',   s:red,     s:none, s:inverse)
call s:HL('DiffText',     s:blue,    s:none, s:inverse)
call s:HL('Directory',    s:fg,      s:none, s:bold . s:italic)
call s:HL('ErrorMsg',     s:red,     s:none, s:italic . s:underline)
call s:HL('FoldColumn',   s:hh)
call s:HL('Folded',       s:hh,      s:none, s:italic . s:underline )
call s:HL('IncSearch',    s:hh,      s:fg,   s:inverse)
call s:HL('LineNr',       s:h,       s:none, s:italic)
call s:HL('MatchParen',   s:magenta, s:none, s:bold)
call s:HL('ModeMsg',      s:green)
call s:HL('NonText',      s:h)
call s:HL('Normal',       s:fg,      s:none)
call s:HL('Pmenu',        s:bg,      s:fg)
call s:HL('PmenuSbar',    s:none,    s:none, s:inverse)
call s:HL('PmenuSel',     s:yellow,  s:bg,   s:underline . s:inverse)
call s:HL('Question',     s:green)
call s:HL('Search',       s:magenta, s:none, s:underline)
call s:HL('SignColumn',   s:hh)
call s:HL('SpecialKey',   s:h)
call s:HL('SpellBad',     s:red,     s:none, s:underline)
call s:HL('StatusLine',   s:yellow,  s:none, s:underline)
call s:HL('StatusLineNC', s:h,       s:none, s:italic . s:underline)
call s:HL('TabLine',      s:h,       s:bg,   s:italic . s:underline)
call s:HL('TabLineFill',  s:h,       s:bg,   s:italic)
call s:HL('TabLineSel',   s:yellow,  s:bg,   s:underline)
call s:HL('Title',        s:fg,      s:none, s:bold)
call s:HL('VertSplit',    s:yellow)
call s:HL('Visual',       s:hh,      s:bg,   s:inverse)
call s:HL('WarningMsg',   s:red,     s:none, s:bold)
call s:HL('WildMenu',     s:yellow,  s:bg,   s:inverse)
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad

" TODO
" call s:HL('Conceal', 
" call s:HL('MoreMsg', 

" Syntax Highlight Groups
call s:HL('Comment',        s:hh,     s:none, s:italic)

call s:HL('Constant',       s:none)
call s:HL('String',         s:none,   s:none, s:italic)
call s:HL('Character',      s:none)
call s:HL('Number',         s:none)
call s:HL('Boolean',        s:none,   s:none, s:bold)
call s:HL('Float',          s:none)

call s:HL('Identifier',     s:none)
call s:HL('Function',       s:green)
call s:HL('VarId',          s:none,   s:none, s:italic)

call s:HL('Statement',      s:none,   s:none, s:bold)
call s:HL('Conditional',    s:none,   s:none, s:bold)
call s:HL('Repeat',         s:none,   s:none, s:bold)
call s:HL('Label',          s:cyan,   s:none)
call s:HL('Operator',       s:none,   s:none, s:bold)
call s:HL('Keyword',        s:none,   s:none, s:bold)
call s:HL('Exception',      s:none,   s:none, s:bold)

call s:HL('PreProc',        s:none)
call s:HL('Include',        s:none,   s:none, s:bold . s:underline)
call s:HL('Define',         s:none)
call s:HL('Macro',          s:none)
call s:HL('PreCondit',      s:none)

call s:HL('Type',           s:none,   s:none, s:underline)
call s:HL('StorageClass',   s:none,   s:none, s:italic)
call s:HL('Structure',      s:none,   s:none, s:bold)
call s:HL('Typedef',        s:none,   s:none, s:underline)

call s:HL('Special',        s:none)
call s:HL('SpecialChar',    s:none)
call s:HL('Tag',            s:none)
call s:HL('Delimiter',      s:none)
call s:HL('SpecialComment', s:none)
call s:HL('Debug',          s:none)

call s:HL('Underlined',     s:none,   s:none, s:underline)
call s:HL('Error',          s:red,    s:none, s:underline)
call s:HL('Todo',           s:yellow, s:none, s:underline . s:italic)

" Filetype-specific
" sh
hi! link shHereDoc Comment
hi! link vimGroup Normal
" pandoc
call s:HL('pandocEmphasis', s:none, s:none, s:italic)
call s:HL('pandocStrong',   s:none, s:none, s:bold)
" diff
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link diffFile DiffText
hi! link diffNewFile DiffChange
hi! link diffLine DiffText
hi! link diffSubName DiffChange
" css
call s:HL('cssImportant', s:none, s:none, s:bold . s:italic . s:underline)
" mutt
hi! link muttrcMacroDescr Comment
