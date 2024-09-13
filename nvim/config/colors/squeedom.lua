-- squeedom.lua
-- Author:  Ben Tilley
-- Created: 2024-09-12
-- Squeedom Colour Scheme (Lua)

vim.cmd.highlight("clear")
vim.g.colors_name = "vim"

local hi = function(name, val)
	-- Force links
	val.force = true

	-- Make sure that `cterm` attribute is not populated from `gui`
	val.cterm = val.cterm or {}

	-- Define global highlight
	vim.api.nvim_set_hl(0, name, val)
end

-- Palette 16
local Black = "#0d1117"
local DarkBlue = "#5f5f87"
local DarkGreen = "#008000"
local DarkCyan = "#008080"
local DarkRed = "#800000"
local DarkMagenta = "#875fd7"
local DarkYellow = "#808000"
local Grey = "#c0c0c0"
local DarkGrey = "#3d444d"
local Blue = "#0000ff"
local Green = "#00ff00"
local Cyan = "#39e5e5"
local Red = "#ff0000"
local Magenta = "#af005f"
local Yellow = "#ffff00"
local White = "#ffffff"

-- Palette Extra
local Grey0 = "#151b23"

--stylua: ignore start
-- General
hi('Normal', {})

hi('Conceal',      { fg = Grey, bg = DarkGrey, ctermfg = 'LightGrey', ctermbg = 'DarkGrey' })
hi('Cursor',       {})
hi('lCursor',      {})
hi('DiffText',     { bg = Red, bold = true,             ctermbg = 'Red', cterm = { bold = true } })
hi('ErrorMsg',     { fg = White, bg = Red,              ctermfg = 'White', ctermbg = 'DarkRed' })
hi('IncSearch',    { reverse = true,                    cterm = { reverse = true } })
hi('ModeMsg',      { bold = true,                       cterm = { bold = true } })
hi('NonText',      { fg = DarkGrey, bold = true,        ctermfg = 'DarkGrey' })
hi('PmenuSbar',    { bg = Grey,                         ctermbg = 'Grey' })
hi('StatusLine',       { fg = Magenta, bg = Black, bold = true,       cterm = { reverse = true, bold = true }})
hi('StatusLineNC',     { fg = DarkGrey, bg = Black,                    cterm = { reverse = true } })
-- :help hl-StatusLineTerm
-- hi('StatusLineTerm',   { fg = Black, bg = Green,                      cterm = { reverse = true } })
-- hi('StatusLineTermNC', { fg = Green, bg = Black,                      cterm = { reverse = true } })
hi('StatusLinePromptAccent',       { fg = Black,    bg = Magenta })
hi('StatusLineFileAccent',         { fg = Grey,     bg = Grey0 })
hi('StatusLinePositionInfoAccent', { fg = DarkGrey, bg = Grey0 })
hi('StatusLineLspAccent',          { fg = Black,    bg = Grey })
hi('TabLineFill',  { link = 'TabLine' })
hi('TabLineSel',   { bg = DarkGrey, bold = true,        ctermbg = 'DarkGrey', cterm = { bold = true } })
hi('TermCursor',   { reverse = true,                    cterm = { reverse = true } })
hi('WinBar',       { bold = true,                       cterm = { bold = true } })
hi('WildMenu',     { fg = Black, bg = Yellow,           ctermfg = 'Black', ctermbg = 'Yellow' })

hi('VertSplit',      { fg = Magenta })
hi('WinSeparator',   { link = 'VertSplit' })
hi('WinBarNC',       { link = 'WinBar' })
hi('EndOfBuffer',    { link = 'NonText' })
hi('LineNrAbove',    { link = 'LineNr' })
hi('LineNrBelow',    { link = 'LineNr' })
hi('QuickFixLine',   { link = 'Search' })
hi('CursorLineSign', { link = 'SignColumn' })
hi('CursorLineFold', { link = 'FoldColumn' })
hi('CurSearch',      { link = 'Search' })
hi('PmenuKind',      { link = 'Pmenu' })
hi('PmenuKindSel',   { link = 'PmenuSel' })
hi('PmenuExtra',     { link = 'Pmenu' })
hi('PmenuExtraSel',  { link = 'PmenuSel' })
hi('Substitute',     { link = 'Search' })
hi('Whitespace',     { link = 'NonText' })
hi('MsgSeparator',   { link = 'StatusLine' })
hi('NormalFloat',    { link = 'Pmenu' })
hi('FloatBorder',    { link = 'WinSeparator' })
hi('FloatTitle',     { link = 'Title' })
hi('FloatFooter',    { link = 'Title' })

hi('FloatShadow',          { bg = 'Black', blend=80 })
hi('FloatShadowThrough',   { bg = 'Black', blend=100 })
hi('RedrawDebugNormal',    { reverse = true,             cterm = { reverse = true } })
hi('RedrawDebugClear',     { bg = 'Yellow',              ctermbg = 'Yellow' })
hi('RedrawDebugComposed',  { bg = 'Green',               ctermbg = 'Green' })
hi('RedrawDebugRecompose', { bg = 'Red',                 ctermbg = 'Red' })
hi('Error',                { fg = 'White', bg = 'Red',   ctermfg = 'White', ctermbg = 'Red' })
hi('Todo',                 { fg = 'Blue', bg = 'Yellow', ctermfg = 'Black', ctermbg = 'Yellow' })

hi('String',         { link = 'Constant' })
hi('Character',      { link = 'Constant' })
hi('Number',         { link = 'Constant' })
hi('Boolean',        { link = 'Constant' })
hi('Float',          { link = 'Number' })
hi('Function',       { link = 'Identifier' })
hi('Conditional',    { link = 'Statement' })
hi('Repeat',         { link = 'Statement' })
hi('Label',          { link = 'Statement' })
hi('Operator',       { link = 'Statement' })
hi('Keyword',        { link = 'Statement' })
hi('Exception',      { link = 'Statement' })
hi('Include',        { link = 'PreProc' })
hi('Define',         { link = 'PreProc' })
hi('Macro',          { link = 'PreProc' })
hi('PreCondit',      { link = 'PreProc' })
hi('StorageClass',   { link = 'Type' })
hi('Structure',      { link = 'Type' })
hi('Typedef',        { link = 'Type' })
hi('Tag',            { link = 'Special' })
hi('SpecialChar',    { link = 'Special' })
hi('Delimiter',      { link = 'Special' })
hi('SpecialComment', { link = 'Special' })
hi('Debug',          { link = 'Special' })

hi('DiagnosticError',            { fg = 'Red',                          ctermfg = 1 })
hi('DiagnosticWarn',             { fg = 'Orange',                       ctermfg = 3 })
hi('DiagnosticInfo',             { fg = 'LightBlue',                    ctermfg = 4 })
hi('DiagnosticHint',             { fg = 'LightGrey',                    ctermfg = 7 })
hi('DiagnosticOk',               { fg = 'LightGreen',                   ctermfg = 10 })
hi('DiagnosticUnderlineError',   { sp = 'Red', underline = true,        cterm = { underline = true } })
hi('DiagnosticUnderlineWarn',    { sp = 'Orange', underline = true,     cterm = { underline = true } })
hi('DiagnosticUnderlineInfo',    { sp = 'LightBlue', underline = true,  cterm = { underline = true } })
hi('DiagnosticUnderlineHint',    { sp = 'LightGrey', underline = true,  cterm = { underline = true } })
hi('DiagnosticUnderlineOk',      { sp = 'LightGreen', underline = true, cterm = { underline = true } })
hi('DiagnosticVirtualTextError', { link = 'DiagnosticError' })
hi('DiagnosticVirtualTextWarn',  { link = 'DiagnosticWarn' })
hi('DiagnosticVirtualTextInfo',  { link = 'DiagnosticInfo' })
hi('DiagnosticVirtualTextHint',  { link = 'DiagnosticHint' })
hi('DiagnosticVirtualTextOk',    { link = 'DiagnosticOk' })
hi('DiagnosticFloatingError',    { link = 'DiagnosticError' })
hi('DiagnosticFloatingWarn',     { link = 'DiagnosticWarn' })
hi('DiagnosticFloatingInfo',     { link = 'DiagnosticInfo' })
hi('DiagnosticFloatingHint',     { link = 'DiagnosticHint' })
hi('DiagnosticFloatingOk',       { link = 'DiagnosticOk' })
hi('DiagnosticSignError',        { link = 'DiagnosticError' })
hi('DiagnosticSignWarn',         { link = 'DiagnosticWarn' })
hi('DiagnosticSignInfo',         { link = 'DiagnosticInfo' })
hi('DiagnosticSignHint',         { link = 'DiagnosticHint' })
hi('DiagnosticSignOk',           { link = 'DiagnosticOk' })
hi('DiagnosticDeprecated',       { sp = 'Red', strikethrough = true,    cterm = { strikethrough = true } })

hi('DiagnosticUnnecessary', { link = 'Comment' })
hi('LspInlayHint',          { link = 'NonText' })
hi('SnippetTabstop',        { link = 'Visual' })

-- Text
hi('@markup.raw',       { link = 'Comment' })
hi('@markup.link',      { link = 'Identifier' })
hi('@markup.heading',   { link = 'Title' })
hi('@markup.link.url',  { link = 'Underlined' })
hi('@markup.underline', { link = 'Underlined' })
hi('@comment.todo',     { link = 'Todo' })

-- Miscs
hi('@comment',     { link = 'Comment' })
hi('@punctuation', { link = 'Delimiter' })

-- Constants
hi('@constant',          { link = 'Constant' })
hi('@constant.builtin',  { link = 'Special' })
hi('@constant.macro',    { link = 'Define' })
hi('@keyword.directive', { link = 'Define' })
hi('@string',            { link = 'String' })
hi('@string.escape',     { link = 'SpecialChar' })
hi('@string.special',    { link = 'SpecialChar' })
hi('@character',         { link = 'Character' })
hi('@character.special', { link = 'SpecialChar' })
hi('@number',            { link = 'Number' })
hi('@boolean',           { link = 'Boolean' })
hi('@number.float',      { link = 'Float' })

-- Functions
hi('@function',                   { link = 'Function' })
hi('@function.builtin',           { link = 'Special' })
hi('@function.macro',             { link = 'Macro' })
hi('@function.method',            { link = 'Function' })
hi('@variable.parameter',         { link = 'Identifier' })
hi('@variable.parameter.builtin', { link = 'Special' })
hi('@variable.member',            { link = 'Identifier' })
hi('@property',                   { link = 'Identifier' })
hi('@attribute',                  { link = 'Macro' })
hi('@attribute.builtin',          { link = 'Special' })
hi('@constructor',                { link = 'Special' })

-- Keywords
hi('@keyword.conditional', { link = 'Conditional' })
hi('@keyword.repeat',      { link = 'Repeat' })
hi('@keyword.type',        { link = 'Structure' })
hi('@label',               { link = 'Label' })
hi('@operator',            { link = 'Operator' })
hi('@keyword',             { link = 'Keyword' })
hi('@keyword.exception',   { link = 'Exception' })

hi('@variable',          { link = 'Identifier' })
hi('@type',              { link = 'Type' })
hi('@type.definition',   { link = 'Typedef' })
hi('@module',            { link = 'Identifier' })
hi('@keyword.import',    { link = 'Include' })
hi('@keyword.directive', { link = 'PreProc' })
hi('@keyword.debug',     { link = 'Debug' })
hi('@tag',               { link = 'Tag' })
hi('@tag.builtin',       { link = 'Special' })

-- LSP semantic tokens
hi('@lsp.type.class',         { link = 'Structure' })
hi('@lsp.type.comment',       { link = 'Comment' })
hi('@lsp.type.decorator',     { link = 'Function' })
hi('@lsp.type.enum',          { link = 'Structure' })
hi('@lsp.type.enumMember',    { link = 'Constant' })
hi('@lsp.type.function',      { link = 'Function' })
hi('@lsp.type.interface',     { link = 'Structure' })
hi('@lsp.type.macro',         { link = 'Macro' })
hi('@lsp.type.method',        { link = 'Function' })
hi('@lsp.type.namespace',     { link = 'Structure' })
hi('@lsp.type.parameter',     { link = 'Identifier' })
hi('@lsp.type.property',      { link = 'Identifier' })
hi('@lsp.type.struct',        { link = 'Structure' })
hi('@lsp.type.type',          { link = 'Type' })
hi('@lsp.type.typeParameter', { link = 'TypeDef' })
hi('@lsp.type.variable',      { link = 'Identifier' })

if vim.o.background == 'light' then
  -- Default colors only used with a light background.
  hi('ColorColumn',  { bg = 'LightRed',                            ctermbg = 'LightRed' })
  hi('CursorColumn', { bg = 'Grey90',                              ctermbg = 'LightGrey' })
  hi('CursorLine',   { bg = 'Grey90',                              cterm = { underline = true } })
  hi('CursorLineNr', { fg = Black, bg = White, bold = true,        ctermfg = 'Black', ctermbg = 'White', cterm = { underline = true } })
  hi('DiffAdd',      { bg = 'LightBlue',                           ctermbg = 'LightBlue' })
  hi('DiffChange',   { bg = 'LightMagenta',                        ctermbg = 'LightMagenta' })
  hi('DiffDelete',   { fg = 'Blue', bg = 'LightCyan', bold = true, ctermfg = 'Blue', ctermbg = 'LightCyan' })
  hi('Directory',    { fg = 'Blue',                                ctermfg = 'DarkBlue' })
  hi('FoldColumn',   { fg = DarkGrey,                              ctermfg = 'DarkGrey' })
  hi('Folded',       { fg = 'DarkBlue', bg = 'LightGrey',          ctermfg = 'DarkBlue', ctermbg = 'Grey' })
  hi('LineNr',       { fg = Grey,                                  ctermfg = 'Grey' })
  hi('MatchParen',   { bg = 'Cyan',                                ctermbg = 'Cyan' })
  hi('MoreMsg',      { fg = 'SeaGreen', bold = true,               ctermfg = 'DarkGreen' })
  hi('Pmenu',        { bg = 'LightMagenta',                        ctermfg = 'Black', ctermbg = 'LightMagenta' })
  hi('PmenuSel',     { bg = 'Grey',                                ctermfg = 'Black', ctermbg = 'LightGrey' })
  hi('PmenuThumb',   { bg = 'Black',                               ctermbg = 'Black' })
  hi('Question',     { fg = 'SeaGreen', bold = true,               ctermfg = 'DarkGreen' })
  hi('Search',       { bg = 'Yellow',                              ctermbg = 'Yellow' })
  -- hi('SignColumn',   { fg = 'DarkBlue', bg = 'Grey',               ctermfg = 'DarkBlue', ctermbg = 'Grey' })
  vim.cmd.highlight({ 'clear', 'SignColumn' })
  hi('SpecialKey',   { fg = 'Blue',                                ctermfg = 'DarkBlue' })
  hi('SpellBad',     { sp = 'Red', undercurl = true,               ctermbg = 'LightRed' })
  hi('SpellCap',     { sp = 'Blue', undercurl = true,              ctermbg = 'LightBlue' })
  hi('SpellLocal',   { sp = 'DarkCyan', undercurl = true,          ctermbg = 'Cyan' })
  hi('SpellRare',    { sp = 'Magenta', undercurl = true,           ctermbg = 'LightMagenta' })
  hi('TabLine',      { fg = Grey, bg = Grey0,                     ctermfg = 'Grey', ctermbg = 'Black', cterm = { underline = true } })
  hi('Title',        { fg = 'Magenta', bold = true,                ctermfg = 'DarkMagenta' })
  hi('Visual',       { fg = 'Black', bg = 'LightGrey',             ctermfg = 'Black', ctermbg = 'Grey' })
  hi('WarningMsg',   { fg = 'Red',                                 ctermfg = 'DarkRed' })
  hi('Comment',      { fg = DarkBlue,                              ctermfg = 'DarkBlue' })
  hi('Constant',     { fg = DarkMagenta,                           ctermfg = 'DarkRed' })
  hi('Special',      { fg = White,                                 ctermfg = 'White' })
  hi('Identifier',   { fg = DarkCyan,                              ctermfg = 'DarkCyan' })
  hi('Statement',    { fg = 'Brown', bold = true,                  ctermfg = 'Brown' })
  hi('PreProc',      { fg = '#6a0dad',                             ctermfg = 'DarkMagenta' })
  hi('Type',         { fg = Yellow, bold = true,                   ctermfg = 'Yellow' })
  hi('Underlined',   { fg = 'SlateBlue', underline = true,         ctermfg = 'DarkMagenta', cterm = { underline = true } })
  hi('Ignore',       {                                             ctermfg = 'White' })
else
  -- Default colors only used with a dark background.
  hi('ColorColumn',  { bg = 'DarkRed',                            ctermbg = 'DarkRed' })
  hi('CursorColumn', { bg = 'Grey40',                             ctermbg = 'DarkGrey' })
  hi('CursorLine',   { bg = 'Grey40',                             cterm = { underline = true } })
  hi('CursorLineNr', { fg = Black, bg = White, bold = true,       ctermfg = 'Black', ctermbg = 'White', cterm = { underline = true } })
  hi('DiffAdd',      { bg = 'DarkBlue',                           ctermbg = 'DarkBlue' })
  hi('DiffChange',   { bg = 'DarkMagenta',                        ctermbg = 'DarkMagenta' })
  hi('DiffDelete',   { fg = 'Blue', bg = 'DarkCyan', bold = true, ctermfg = 'Blue', ctermbg = 'DarkCyan' })
  hi('Directory',    { fg = 'Cyan',                               ctermfg = 'LightCyan' })
  hi('FoldColumn',   { fg = Grey,                                 ctermfg = 'Grey' })
  hi('Folded',       { fg = 'Cyan', bg = 'DarkGrey',              ctermfg = 'Cyan', ctermbg = 'DarkGrey' })
  hi('LineNr',       { fg = Grey, bg = Grey0,                    ctermfg = 'Grey', ctermbg = 'Black' })
  hi('MatchParen',   { bg = 'DarkCyan',                           ctermbg = 'DarkCyan' })
  hi('MoreMsg',      { fg = 'SeaGreen', bold = true,              ctermfg = 'LightGreen' })
  hi('Pmenu',        { bg = 'Magenta',                            ctermfg = 'Black', ctermbg = 'Magenta' })
  hi('PmenuSel',     { bg = 'DarkGrey',                           ctermfg = 'DarkGrey', ctermbg = 'Black' })
  hi('PmenuThumb',   { bg = 'White',                              ctermbg = 'White' })
  hi('Question',     { fg = 'Green', bold = true,                 ctermfg = 'LightGreen' })
  hi('Search',       { fg = 'Black', bg = 'Yellow',               ctermfg = 'Black', ctermbg = 'Yellow' })
  hi('SignColumn',   { fg = Grey, bg = Grey0,                    ctermfg = 'Grey', ctermbg = 'Black' })
  hi('SpecialKey',   { fg = 'Cyan',                               ctermfg = 'LightBlue' })
  hi('SpellBad',     { sp = 'Red', undercurl = true,              ctermbg = 'Red' })
  hi('SpellCap',     { sp = 'Blue', undercurl = true,             ctermbg = 'Blue' })
  hi('SpellLocal',   { sp = 'Cyan', undercurl = true,             ctermbg = 'Cyan' })
  hi('SpellRare',    { sp = 'Magenta', undercurl = true,          ctermbg = 'Magenta' })
  hi('TabLine',      { fg = Grey, bg = Grey0,                     ctermfg = 'Grey', ctermbg = 'Black', cterm = { underline = true } })
  hi('Title',        { fg = 'Magenta', bold = true,               ctermfg = 'LightMagenta' })
  hi('Visual',       { fg = 'LightGrey', bg = '#575757',          ctermfg = 'Black', ctermbg = 'Grey' })
  hi('WarningMsg',   { fg = 'Red',                                ctermfg = 'LightRed' })
  hi('Whitespace',   { fg = DarkGrey,                             ctermfg = 'DarkGrey' })
  hi('Comment',      { fg = DarkBlue,                             ctermfg = 'DarkBlue' })
  hi('Constant',     { fg = DarkMagenta,                          ctermfg = 'DarkMagenta' })
  hi('Special',      { fg = White,                                ctermfg = 'White' })
  hi('Identifier',   { fg = Cyan,                                 ctermfg = 'Cyan', cterm = { bold = true } })
  hi('Statement',    { fg = Magenta, bold = true,                 ctermfg = 'Magenta' })
  hi('PreProc',      { fg = '#ff80ff',                            ctermfg = 'LightBlue' })
  hi('Type',         { fg = '#60ff60', bold = true,               ctermfg = 'LightGreen' })
  hi('Underlined',   { fg = '#80a0ff', underline = true,          ctermfg = 'LightBlue', cterm = { underline = true } })
  hi('Ignore',       {                                            ctermfg = 'Black' })
end
--stylua: ignore end
