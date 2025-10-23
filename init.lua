-- tstvim
--

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
vim.o.showmode = false -- Don't show the mode, since it's already in the status line

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
	vim.g.clpboard = {
		name = "WslClpboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end)

vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- save undo history

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes" -- Keep signcolumn on by default
vim.o.updatetime = 250
vim.o.timeoutlen = 1000 -- Mapped sequence wait time

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
vim.o.list = true -- See `:help 'list'`
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- See `:help 'listchars'`

vim.o.inccommand = "split" -- Preview substitutions live, as you type!

vim.o.cursorline = true -- Show which line your cursor is on
vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" }) -- Diagnostic keymaps
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- Exit terminal mode

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.lsp.enable({
	"lua_ls",
	"jdtls",
})

vim.diagnostic.config({
	-- Use the default configuration
	-- virtual_lines = true,

	-- Alternatively, customize specific options
	virtual_lines = {
	 -- Only show virtual line diagnostics for the current cursor line
	 current_line = true,
	},
})
