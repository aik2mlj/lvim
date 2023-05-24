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
lvim.colorscheme = "kanagawa"
if vim.g.neovide == nil then
	lvim.transparent_window = true
end
-- lvim.builtin.lualine.style = "default"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<CR>"
lvim.keys.normal_mode["<C-a>"] = "ggVG"
lvim.keys.insert_mode["<C-a>"] = "<ESC>ggVG"
lvim.keys.normal_mode["gx"] = "<cmd>execute '!xdg-open ' .. shellescape(expand('<cfile>'), v:true)<cr>"
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q!<CR>"
-- lvim.keys.insert_mode["<C-q>"] = "<ESC>:q!<CR>"

-- GUI settings for neovide
vim.opt.guifont = "FiraCode Nerd Font:h10"
vim.g.neovide_transparency = 0.5
-- vim.g.neovide_no_idle = "v:true"

vim.opt.wrap = true
vim.opt.lbr = true
vim.opt.tw = 0
vim.opt.virtualedit = "block"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.indentexpr = ""
vim.opt.confirm = true
vim.opt.spelllang = "en,cjk"
vim.opt.shell = "/bin/sh"
vim.opt.scrolloff = 15

-- My vim keymappings
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.keys.normal_mode["gh"] = "<Cmd>lua vim.lsp.buf.hover()<CR>"
lvim.keys.normal_mode["<M-Left>"] = "<C-o>"
lvim.keys.normal_mode["<M-Right>"] = "<C-i>"
-- lvim.lsp.buffer_mappings.normal_mode["gd"] = nil
-- lvim.lsp.buffer_mappings.normal_mode["gr"] = nil
-- lvim.keys.normal_mode["gd"] = "<cmd>Trouble lsp_definitions<CR>"
-- lvim.keys.normal_mode["gr"] = "<cmd>Trouble lsp_references<cr>"
vim.cmd([[
	nnoremap <expr> j v:count ? 'j' : 'gj'
	nnoremap <expr> k v:count ? 'k' : 'gk'
]])
vim.cmd([[
	map Q gq
	noremap Y y$
	nnoremap < <<
	nnoremap > >>
	nnoremap U <C-r>
]])
vim.cmd([[
	noremap <silent> H g^
	noremap <silent> L g$
	noremap <silent> J 5gj
	noremap <silent> K 5gk
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
	nnoremap <silent> <M-h> :BufferLineCyclePrev<CR>
	nnoremap <silent> <M-l> :BufferLineCycleNext<CR>
    nnoremap <silent> <M-H> :BufferLineMovePrev<CR>
    nnoremap <silent> <M-L> :BufferLineMoveNext<CR>
	nnoremap <silent> <M-p> :b#<CR>
	nnoremap <silent> <M-n> :e
	nnoremap <silent> <M-q> :bd<CR>
	nnoremap <silent> <M-Q> :bd!<CR>
	inoremap <silent> <M-h> <ESC>:BufferLineCyclePrev<CR>
	inoremap <silent> <M-l> <ESC>:BufferLineCycleNext<CR>
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

lvim.builtin.terminal.open_mapping = "<C-t>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["o"] = { "<cmd>RnvimrToggle<cr>", "Rnvimr" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>q<CR>", "Quit" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<CR>", "Force Quit" }
-- lvim.builtin.which_key.mappings["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["j"] = { "J", "Join Lines" }
lvim.builtin.which_key.vmappings["j"] = { "J", "Join Lines" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["h"] = { "<cmd>nohlsearch<CR><cmd>call minimap#vim#ClearColorSearch()<CR>", "No Highlight", }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
	t = { "<cmd>TodoTrouble<cr>", "Todo list" },
}
lvim.builtin.which_key.mappings["k"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Show Hover" }
lvim.builtin.which_key.vmappings["f"] = { 'y<ESC>/<c-r>"<CR>', "Search Selected" }
lvim.builtin.which_key.vmappings["F"] = { "<cmd>Telescope grep_string<cr>", "Global Search Selected" }
lvim.builtin.which_key.mappings["r"] = { ":%s//g<Left><Left>", "Global Replace" }
lvim.builtin.which_key.vmappings["r"] = { ":s//g<Left><Left>", "Replace in Selected" }
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" }
lvim.builtin.which_key.mappings[";"] = { "<cmd>Telescope resume<CR>", "Telescope" }
lvim.builtin.which_key.mappings["n"] = { "<cmd>lua require('nabla').popup()<CR>", "Nabla..." }
lvim.builtin.which_key.mappings["C"] = { "<cmd>ColorizerToggle<CR>", "Toggle Colorizer" }

lvim.builtin.which_key.mappings["dh"] = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Value" }
lvim.builtin.which_key.mappings["dS"] = {
	"<cmd>lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).open()<CR>",
	"Toggle Scopes",
}
lvim.builtin.which_key.mappings["df"] = {
	"<cmd>lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').frames).open()<CR>",
	"Toggle Frames",
}
lvim.builtin.which_key.mappings["gG"] = {
	"<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'lazygit', count = 101, direction = 'float'})<CR>",
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.start_in_insert = true
local on_attach = require("nvim-tree-on-attach").on_attach
lvim.builtin.nvimtree.setup.on_attach = on_attach

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
	"markdown",
	"markdown_inline",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
vim.filetype.add({ extension = { typ = "typst" } })
lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.treesitter.highlight.disable = {}
-- lvim.builtin.treesitter.rainbow.enable = true
-- lvim.builtin.treesitter.rainbow.disable = { "latex" }
-- lvim.builtin.treesitter.rainbow.colors = {
-- 	"Gold",
-- 	-- "Salmon",
-- 	"Orchid",
-- 	"DodgerBlue",
-- 	-- "Cornsilk",
-- 	-- "LawnGreen",
-- }

lvim.builtin.dap.active = true
local dap = require("dap")
dap.defaults.fallback.external_terminal = {
	command = "/usr/bin/alacritty",
	args = { "-e" },
}
-- dap.defaults.fallback.force_external_terminal = true

-- generic LSP settings

---@usage disable automatic installation of servers
vim.diagnostic.config({ virtual_text = false })
-- lvim.lsp.document_highlight = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "ltex"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
	-- local function buf_set_option(...)
	--     vim.api.nvim_buf_set_option(bufnr, ...)
	-- end
	-- --Enable completion triggered by <c-x><c-o>
	-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	require("lsp_signature").on_attach()
end
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
	-- { exe = "black", filetypes = { "python" } },
	{
		exe = "yapf",
		-- args = { "--style", "facebook" },
		filetypes = { "python" },
	},
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

-- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- {
	-- 	exe = "flake8",
	-- 	filetypes = { "python" },
	-- args = { "--max-line-length=88", "--extend-ignore=E203" },
	-- },
	--  {
	-- exe = "shellcheck",
	-- ---@usage arguments to pass to the formatter
	-- -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	-- args = { "--severity", "warning" },
	--  },
	{
		exe = "codespell",
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		-- filetypes = { "javascript", "python", "markdown", "html" },
	},
})

-- Additional Plugins
lvim.plugins = {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = "TroubleToggle",
		config = function()
			require("trouble").setup({
				height = 5,
				padding = false,
			})
		end,
	},
	{
		"lervag/vimtex",
		config = function()
			vim.g["tex_flavor"] = "latex"
			vim.g["vimtex_quickfix_mode"] = 0
			-- vim.g["vimtex_view_general_viewer"] = "/mnt/c/Users/ASUS/AppData/Local/SumatraPDF/SumatraPDF.exe"
			-- vim.g["vimtex_view_general_options"] = "-reuse-instance -forward-search @tex @line @pdf"
			-- vim.g["vimtex_view_general_options_latexmk"] = "-reuse-instance"
			-- * If in linux, use the following lines instead.
			vim.g["vimtex_view_general_viewer"] = "zathura"
			-- vim.g["vimtex_view_method"] = "zathura"
			vim.g["vimtex_compiler_progname"] = "nvr"
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"ellisonleao/glow.nvim",
		ft = { "markdown" },
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = "cd app && npm install",
	-- 	ft = "markdown",
	-- 	config = function()
	-- 		vim.g.mkdp_auto_start = 1
	-- 	end,
	-- },
	{
		"ray-x/lsp_signature.nvim",
		-- event = "BufRead",
		-- config = function()
		-- 	require("lsp_signature").setup()
		-- end,
	},
	{
		"simrat39/symbols-outline.nvim",
		-- cmd = "SymbolsOutline",
	},
	{
		"folke/zen-mode.nvim",
		-- config = function()
		-- 	require("zen-mode").setup()
		-- end,
	},
	{ "folke/twilight.nvim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{
		"jbyuki/nabla.nvim",
	},
	{
		"h-hg/fcitx.nvim",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"kevinhwang91/rnvimr",
		cmd = "RnvimrToggle",
		config = function()
			vim.g.rnvimr_draw_border = 1
			vim.g.rnvimr_enable_picker = 1
			vim.g.rnvimr_enable_ex = 1
			vim.g.rnvimr_enable_bw = 1
		end,
	},
	{
		"lukas-reineke/headlines.nvim",
	},
	{ "kylechui/nvim-surround" },
	{
		"cameron-wags/rainbow_csv.nvim",
		config = function()
			require("rainbow_csv").setup()
		end,
		-- optional lazy-loading below
		lazy = {
			"rainbow_csv",
			"rainbow_csv.fns",
		},
		ft = {
			"csv",
			"tsv",
			"csv_semicolon",
			"csv_whitespace",
			"csv_pipe",
			"rfc_csv",
			"rfc_semicolon",
		},
	},
	{ "folke/tokyonight.nvim" },
	{ "kaarmu/typst.vim", ft = "typst" },
}

lvim.builtin.autopairs.on_config_done = function(autopairs)
	autopairs.remove_rule("$")
	autopairs.remove_rule("'")
end

-- * Shortcuts for plugins
lvim.keys.normal_mode["\\p"] = "<cmd>MarkdownPreviewToggle<CR>"

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
-- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- { "BufWinEnter", "*", "MinimapRefresh" },
-- { "FileType", "dap-float", "nnoremap <buffer><silent><ESC> <cmd>close!<CR>" },
-- }
