" ----------------------------------------------------------------------------
" File: thatoldlook.vim
" Description: A minimal colorscheme for Vim based on 
" That Old Look from colourlovers by syork
" Author: duckwork <casedizz@gmail.com>
" Source: https://github.com/duckwork/thatoldlook
" Last Modified: 3 December 2015
" ----------------------------------------------------------------------------

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "thatoldlook"

let s:is_dark = (&background == 'dark')

" Palette
let s:c = {
      \ 'dark': '#584c46',
      \ 'smdk': '#685c56',
      \ 'twen': '#a89c84',
      \ 'lite': '#f8ecc2',
      \ 'smlt': '#e8dcb2',
      \ 'bl':   '#202020',
      \ 'wh':   '#d0d0d0',
      \ }

if s:is_dark
  let s:fg = s:c.lite
  let s:sm = s:c.smdk
  let s:bg = s:c.dark
  let s:BG = s:c.bl
  let s:hh = '#786c66'
  set background=dark
else
  let s:fg = s:c.dark
  let s:sm = s:c.smlt
  let s:bg = s:c.lite
  let s:BG = s:c.wh
  let s:hh = '#d8cca2'
  set background=light
endif

let s:red     = '#da825f'
let s:green   = '#73c064'
let s:yellow  = '#d6b51f'
let s:blue    = '#5091b2'
let s:magenta = '#ce7198'
let s:cyan    = '#8eb2a4'

let s:bold      = 'bold,'
let s:italic    = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse   = 'inverse,'

let s:vim_bg = 'bg'
let s:vim_fg = 'fg'
let s:none   = 'NONE'

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp
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

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg,
        \ 'guibg=' . bg,
        \ 'gui='   . emstr[:-2],
        \ ]

  if a:0 >= 3
    call add(histring, 'guisp=' . a:3)
  endif

  execute join(histring, ' ')
endfunction

" ----------------------- Standard Vim Highlight Groups
call s:HL('Normal',       s:fg,     s:bg)

call s:HL('ColorColumn',  s:none,   s:sm)
call s:HL('Cursor',       s:c.twen, s:none, s:inverse)
call s:HL('CursorColumn', s:sm,     s:none, s:inverse)
call s:HL('CursorLine',   s:none)
call s:HL('CursorLineNr', s:fg,     s:none, s:italic)
call s:HL('Directory',    s:fg,     s:none, s:bold . s:italic)
call s:HL('ErrorMsg',     s:red,    s:BG,   s:italic)
call s:HL('IncSearch',    s:hh,     s:fg,   s:inverse)
call s:HL('LineNr',       s:hh,     s:none, s:italic)
call s:HL('MatchParen',   s:fg,     s:none, s:bold . s:inverse)
call s:HL('ModeMsg',      s:green)
call s:HL('NonText',      s:hh)
call s:HL('Question',     s:green)
call s:HL('Search',       s:hh,     s:fg,   s:inverse)
call s:HL('SpecialKey',   s:hh)
call s:HL('SpellBad',     s:red,    s:none, s:underline)
call s:HL('StatusLine',   s:yellow, s:none, s:underline)
call s:HL('StatusLineNC', s:hh,     s:none, s:italic . s:underline)
call s:HL('TabLine',      s:c.twen, s:bg,   s:italic . s:underline)
call s:HL('TabLineFill',  s:c.twen, s:bg,   s:italic)
call s:HL('TabLineSel',   s:yellow, s:bg,   s:underline)
call s:HL('Title',        s:fg,     s:none, s:bold)
call s:HL('VertSplit',    s:yellow)
call s:HL('Visual',       s:fg,     s:bg,   s:inverse)
call s:HL('WarningMsg',   s:red,    s:none, s:bold)
call s:HL('WildMenu',     s:hh,     s:bg,   s:inverse)
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad
call s:HL('Folded',       s:fg,     s:hh, s:italic)

" TODO
" call s:HL('Conceal', 
" call s:HL('CursorIM', 
" call s:HL('DiffAdd', 
" call s:HL('DiffChange', 
" call s:HL('DiffDelete', 
" call s:HL('DiffText', 
" call s:HL('FoldColumn', 
" call s:HL('SignColumn', 
" call s:HL('MoreMsg', 
" call s:HL('Pmenu', 
" call s:HL('PmenuSel', 
" call s:HL('PmenuSbar', 
" call s:HL('PmenuThumb', 
" call s:HL('VisualNOS', 

" ---------------------- Standard Syntax Highlight Groups

call s:HL('Comment',        s:c.twen, s:none, s:italic)

call s:HL('Constant',       s:fg )
call s:HL('String',         s:fg )
call s:HL('Character',      s:fg )
call s:HL('Number',         s:fg )
call s:HL('Boolean',        s:green )
call s:HL('Float',          s:fg )

call s:HL('Identifier',     s:fg )
call s:HL('Function',       s:green )
call s:HL('VarId',          s:fg,     s:none, s:italic )

call s:HL('Statement',      s:fg,     s:none, s:bold )
call s:HL('Conditional',    s:fg,     s:none, s:bold )
call s:HL('Repeat',         s:fg,     s:none, s:bold )
call s:HL('Label',          s:cyan,  s:none)
call s:HL('Operator',       s:magenta, s:none )
call s:HL('Keyword',        s:fg,     s:none, s:bold )
call s:HL('Exception',      s:fg,     s:none, s:bold )

call s:HL('PreProc',        s:fg )
call s:HL('Include',        s:fg,     s:none, s:bold . s:underline )
call s:HL('Define',         s:fg )
call s:HL('Macro',          s:fg )
call s:HL('PreCondit',      s:fg )

call s:HL('Type',           s:fg,     s:none, s:underline )
call s:HL('StorageClass',   s:fg,     s:none, s:underline )
call s:HL('Structure',      s:fg,     s:none, s:bold )
call s:HL('Typedef',        s:fg,     s:none, s:underline )

call s:HL('Special',        s:fg )
call s:HL('SpecialChar',    s:fg )
call s:HL('Tag',            s:fg )
call s:HL('Delimiter',      s:fg )
call s:HL('SpecialComment', s:fg )
call s:HL('Debug',          s:fg )

call s:HL('Underlined',     s:fg,     s:none, s:underline )
call s:HL('Error',          s:red,    s:fg,   s:underline . s:inverse )
call s:HL('Todo',           s:yellow, s:none, s:underline . s:italic )

" ----------------------- Filetypes
" sh
hi! link shHereDoc Comment
hi! link vimGroup Normal
" pandoc
call s:HL('pandocEmphasis', s:fg, s:none, s:italic)
call s:HL('pandocStrong',   s:fg, s:none, s:bold)

