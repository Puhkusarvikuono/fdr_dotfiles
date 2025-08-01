-- nixis.core.options
--
-- This file contains the core options for Neovim.

-- Set netrw liststyle to 3 (tree view)
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2       -- Number of spaces a <Tab> in the file counts for.
opt.shiftwidth = 2    -- Number of spaces to use for each step of (auto)indent.
opt.expandtab = true  -- Use spaces instead of tabs.
opt.autoindent = true -- Copy indent from current line when starting a new one.

-- Wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true -- Ignore case when searching.
opt.smartcase = true  -- Override ignorecase if search pattern contains uppercase letters.

-- Appearance
opt.cursorline = true    -- Highlight the current line.
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI.
opt.background = "dark"  -- Set background to dark.
opt.signcolumn = "yes"   -- Always show the sign column.

-- Backspace behavior
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line, or insert mode start.

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use the system clipboard for yank and paste.

-- Split windows
opt.splitright = true -- Split vertical windows to the right.
opt.splitbelow = true -- Split horizontal windows to the bottom.

