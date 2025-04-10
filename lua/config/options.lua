-- UI
vim.o.termguicolors = true -- Enable true color support
vim.o.number = true -- Show absolute line numbers
vim.o.cursorline = true -- Highlight the current line
vim.o.cursorlineopt = "number"
vim.o.signcolumn = "number" -- Show sign column in number column
vim.o.ruler = false -- Disable default ruler
vim.o.wrap = true -- Wrap lines at word boundaries
vim.o.linebreak = true -- Wrap lines at convenient points
vim.o.cmdheight = 0 -- Hide command bar
vim.o.laststatus = 0 -- Hide statusline (requires external one)
vim.opt.shortmess:append("sI") -- Skip nvim intro
vim.opt.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

-- UX
vim.o.mouse = "" -- Disable mouse input
vim.o.confirm = true -- Confirm before exiting modified buffer
vim.o.virtualedit = "block" -- Allow blockwise cursor past EOL
vim.o.autowrite = true -- Auto-save on buffer switch
vim.o.winborder = "single" -- Single-line window border
vim.o.completeopt = "menu,menuone,popup,fuzzy" -- Completion UI settings
vim.o.pumheight = 10 -- Max popup menu height
vim.o.splitright = true -- Vertical splits open to the right
vim.o.splitbelow = true -- Horizontal splits open below

-- Indentation (default; can be overridden per ft)
vim.o.tabstop = 4 -- Width of a tab character
vim.o.softtabstop = 4 -- Tab key inserts 4 spaces
vim.o.shiftwidth = 4 -- Indent width
vim.o.expandtab = true -- Use spaces instead of tabs

-- Search
vim.o.ignorecase = true -- Ignore case in searches
vim.o.smartcase = true -- Use case-sensitive search if uppercase used
vim.o.inccommand = "split" -- Live preview of :s command
vim.o.hlsearch = true -- Highlight search matches

-- File Handling
vim.o.swapfile = false -- Disable swapfile
vim.o.undofile = true -- Enable persistent undo

-- Clipboard
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Use system clipboard if not over SSH

-- Disable unused built-ins
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_gzipPlugin = 0
vim.g.loaded_matchit = 0
vim.g.loaded_matchparen = 1
vim.g.loaded_tutor = 0
vim.g.editorconfig = false
