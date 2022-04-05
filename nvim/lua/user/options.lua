local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.signcolumn = "yes:2"
opt.relativenumber = true
opt.number = true
opt.termguicolors = true
opt.undofile = true
opt.spell = true
opt.title = true
opt.ignorecase = true
opt.smartcase = true
opt.wildmode = "longest:full,full"
opt.wrap = false
opt.list = true
opt.listchars = "tab:▸ ,trail:·"
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus" -- MacOS clipboard
opt.confirm = true
opt.backup = false
-- opt.undodir = '~/.vim/undodir'
opt.undofile = true
opt.updatetime = 250 -- Decrease CursorHold delay
opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
opt.showmode = false
opt.fillchars = "eob: "
opt.hidden = true
opt.cmdheight = 2
opt.shortmess:append('c') 
-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore
-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done
