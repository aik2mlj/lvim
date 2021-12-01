--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<CR>"
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q!<CR>"
-- lvim.keys.insert_mode["<C-q>"] = "<ESC>:q!<CR>"

vim.opt.expandtab = false
vim.opt.wrap = true
vim.opt.tw = 0
vim.opt.virtualedit = "block"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.indentexpr = ""
vim.opt.confirm = true

-- My vim keymappings
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
vim.cmd([[
	map Q gq
	noremap Y y$
	nnoremap < <<
	nnoremap > >>
	nnoremap U <C-r>
]])
vim.cmd([[
	noremap <silent> H ^
	noremap <silent> L $
	noremap <silent> J 5j
	noremap <silent> K 5k
]])
vim.cmd([[
	noremap <C-f> <C-w>w
	noremap s <nop>
	noremap ss :vsplit<CR>
	noremap sd :split<CR>
	noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
	noremap sj :set splitbelow<CR>:split<CR>
	noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
	noremap sl :set splitright<CR>:vsplit<CR>
	noremap so <C-w>o
	noremap su <C-w>t<C-w>K
	noremap sv <C-w>t<C-w>H
]])
vim.cmd([[
	nnoremap <silent> <M-h> :bp<CR>
	nnoremap <silent> <M-l> :bn<CR>
	nnoremap <silent> <M-p> :b#<CR>
	nnoremap <silent> <M-n> :enew<CR>
	nnoremap <silent> <M-q> :bd<CR>
	nnoremap <silent> <M-Q> :bd!<CR>
	inoremap <silent> <M-h> <ESC>:bp<CR>
	inoremap <silent> <M-l> <ESC>:bn<CR>
	inoremap <silent> <M-p> <ESC>:b#<CR>
	inoremap <silent> <M-n> <ESC>:enew<CR>
	inoremap <silent> <M-q> <ESC>:bd<CR>
	inoremap <silent> <M-Q> <ESC>:bd!<CR>
	noremap <C-n> :vnew<CR>
]])
vim.cmd([[
	nnoremap <M-J> :t .<CR>
	nnoremap <M-K> :t .-1<CR>
	xnoremap <M-J> :t'><CR>gv
	xnoremap <M-K> :t-1<CR>gv
]])

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["q"] = { "<cmd>q<CR>", "Quit" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<CR>", "Force Quit" }
lvim.builtin.which_key.mappings["j"] = { "J", "Join Lines" }
lvim.builtin.which_key.vmappings["j"] = { "J", "Join Lines" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}
lvim.builtin.which_key.mappings["k"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Show Hover" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
	"fish",
	"javascript",
	"json",
	"latex",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false
lvim.lsp.diagnostics.virtual_text = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--	 vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--	 return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--	   or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--	 return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--	 return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black", filetypes = { "python" } },
	{
		exe = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		args = { "--print-with", "100" },
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = { "typescript", "typescriptreact" },
	},
	{ exe = "stylua", filetypes = { "lua" } },
})

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--	 exe = "shellcheck",
--	 ---@usage arguments to pass to the formatter
--	 -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--	 args = { "--severity", "warning" },
--   },
--   {
--	 exe = "codespell",
--	 ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--	 filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
	{ "folke/tokyonight.nvim" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	-- { "lervag/vimtex" },
}
-- vim.g["tex_flavor"] = "latex"
-- vim.g["vimtex_quickfix_mode"] = 0
-- vim.g["vimtex_view_general_viewer"] = "/mnt/c/Users/ASUS/AppData/Local/SumatraPDF/SumatraPDF.exe"
-- vim.g["vimtex_view_general_options"] = "-reuse-instance -forward-search @tex @line @pdf"
-- vim.g["vimtex_view_general_options_latexmk"] = "-reuse-instance"
-- * If in linux, use the following lines instead.
-- vim.g["vimtex_view_general_viewer"] = "zathura"
-- vim.g["vimtex_view_method"] = "zathura"
-- vim.g["vimtex_compiler_progname"] = "nvr"
local autoPair = require("nvim-autopairs")
autoPair.setup({
	disable_filetype = { "TelescopePrompt", "tex" },
})
autoPair.remove_rule("$")
autoPair.disable()

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
