-- ~/.config/nvim/colors/minimal-eye.lua - Improved minimal, eye-friendly Neovim theme

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

vim.g.colors_name = 'minimal-eye'
vim.o.background = 'dark'

-- Color palette
local colors = {
  bg = '#0f0f0f',
  bg_light = '#1a1a1a',
  fg = '#a8a8a8',
  fg_dim = '#4a4a4a',      -- Slightly dimmer for comments
  fg_bright = '#d0d0d0',

  accent1 = '#6b906c',     -- Strings
  accent2 = '#a4b494',     -- Functions
  accent3 = '#6b8faf',     -- Keywords
  accent4 = '#5b8e8c',     -- for builtin types

  border = '#2a2a2a',
  selection = '#2a2a2a',
  cursor_line = '#141414',

  -- Diagnostics (minimal, but needed for LSP)
  red = '#EB6F92',
  yellow = '#bfa76a',
  blue = '#7a99b6',
  cyan = '#7ab6b6',
  orange = '#b68d6b',
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor highlights
hl('Normal',         { fg = colors.fg, bg = colors.bg })
hl('NormalFloat',    { fg = colors.fg, bg = colors.bg_light })
hl('CursorLine',     { bg = colors.cursor_line })
hl('CursorColumn',   { bg = colors.cursor_line })
hl('ColorColumn',    { bg = colors.cursor_line })
hl('LineNr',         { fg = colors.fg_dim })
hl('CursorLineNr',   { fg = colors.fg_bright, bold = true })
hl('SignColumn',     { bg = colors.bg })
hl('Folded',         { fg = colors.fg_dim, bg = colors.bg_light })
hl('FoldColumn',     { fg = colors.fg_dim, bg = colors.bg })

-- Search and selection
hl('Visual',         { bg = colors.selection })
hl('Search',         { fg = colors.bg, bg = colors.yellow })
hl('IncSearch',      { fg = colors.bg, bg = colors.orange })

-- Popup menu
hl('Pmenu',          { fg = colors.fg, bg = colors.bg_light })
hl('PmenuSel',       { fg = colors.bg, bg = colors.accent2 })
hl('PmenuSbar',      { bg = colors.bg_light })
hl('PmenuThumb',     { bg = colors.border })

-- Statusline
hl('StatusLine',     { fg = colors.fg, bg = colors.bg_light })
hl('StatusLineNC',   { fg = colors.fg_dim, bg = colors.bg_light })

-- Splits and borders
hl('VertSplit',      { fg = colors.border })
hl('WinSeparator',   { fg = colors.border })

-- Syntax highlighting
hl('Comment',        { fg = colors.fg_dim, italic = true })        -- More dim, italic
hl('Constant',       { fg = colors.fg })                           -- Neutral, not too bright
hl('String',         { fg = colors.accent1 })                      -- Accent
hl('Character',      { fg = colors.accent1 })
hl('Number',         { fg = colors.fg })
hl('Boolean',        { fg = colors.fg })
hl('Float',          { fg = colors.fg })

hl('Identifier',     { fg = colors.fg })
hl('Function',       { fg = colors.accent2, bold = true })         -- Slightly bolder

hl('Statement',      { fg = colors.accent3 })
hl('Conditional',    { fg = colors.accent3 })
hl('Repeat',         { fg = colors.accent3 })
hl('Label',          { fg = colors.accent3 })
hl('Operator',       { fg = colors.fg })
hl('Keyword',        { fg = colors.accent3 })
hl('Exception',      { fg = colors.accent3 })

hl('PreProc',        { fg = colors.fg })
hl('Include',        { fg = colors.fg })
hl('Define',         { fg = colors.fg })
hl('Macro',          { fg = colors.fg })
hl('PreCondit',      { fg = colors.fg })

hl('Type',           { fg = colors.fg })
hl('StorageClass',   { fg = colors.fg })
hl('Structure',      { fg = colors.fg })
hl('Typedef',        { fg = colors.fg })

hl('Special',        { fg = colors.fg })
hl('SpecialChar',    { fg = colors.fg })
hl('Tag',            { fg = colors.fg })
hl('Delimiter',      { fg = colors.fg })
hl('SpecialComment', { fg = colors.fg_dim, italic = true })
hl('Debug',          { fg = colors.fg_bright })

-- Error and warning
hl('Error',          { fg = colors.red})
hl('ErrorMsg',       { fg = colors.red})
hl('WarningMsg',     { fg = colors.red})

-- Diff
hl('DiffAdd',        { fg = colors.accent2, bg = colors.bg })
hl('DiffChange',     { fg = colors.fg_bright, bg = colors.bg })
hl('DiffDelete',     { fg = colors.fg_dim, bg = colors.bg })
hl('DiffText',       { fg = colors.fg_bright, bg = colors.bg })

-- Git signs
hl('GitSignsAdd',    { fg = colors.accent2 })
hl('GitSignsChange', { fg = colors.fg_bright })
hl('GitSignsDelete', { fg = colors.fg_dim })

-- Treesitter highlights
hl('@comment',       { fg = colors.fg_dim, italic = true })
hl('@constant',      { fg = colors.fg })
hl('@string',        { fg = colors.accent1 })
hl('@number',        { fg = colors.fg })
hl('@boolean',       { fg = colors.fg, italic = true })
hl('@function',      { fg = colors.accent2, bold = true })
hl('@keyword',       { fg = colors.accent3 })
hl('@operator',      { fg = colors.fg })
hl('@type',          { fg = colors.fg })
hl('@variable',      { fg = colors.fg })
hl('@parameter',     { fg = colors.fg })
hl('@property',      { fg = colors.fg })
hl('@type.builtin',  { fg = colors.accent4 })

-- LSP highlights
hl('DiagnosticError', { fg = colors.red })
hl('DiagnosticWarn',  { fg = colors.yellow })
hl('DiagnosticInfo',  { fg = colors.blue })
hl('DiagnosticHint',  { fg = colors.cyan })

-- Telescope
hl('TelescopeNormal',    { fg = colors.fg, bg = colors.bg })
hl('TelescopeBorder',    { fg = colors.border })
hl('TelescopeSelection', { bg = colors.selection })
hl('TelescopeMatching',  { fg = colors.yellow })

