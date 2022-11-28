--[[
-- scriptencoding utf-8

lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- This is lua code that sets variables based on which machine we're runnning on

HOSTNAME = os.getenv("HOSTNAME")
if (HOSTNAME ~= "BAP024L") then
  VIMWIKI_PATH = '/home/gabfor@corp.unibap.net/Personal_Nextcloud/wiki'
  vim.g.email = 'gabriel.fornaeus@unibap.com'
  vim.g.username = 'Gabriel Fornaeus, Unibap AB'
  vim.g.license = ' '
else
  VIMWIKI_PATH = '/home/gabriel/Nextcloud/wiki'
  vim.g.email = 'gf@hax0r.se'
  vim.g.username = 'Gabriel Fornaeus'
  vim.g.license = 'GPLv3'
end
-- general
lvim.log.level = "warn"
vim.opt.termguicolors = true
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-storm"
vim.opt.timeoutlen = 300
vim.opt.cmdheight = 1

-- List chars
vim.opt.list = true
vim.opt.listchars = { eol = '¶', space = '␣', trail = '♺', extends = '◀',
  precedes = '▶' }
vim.opt.listchars:append("tab:»")
vim.opt.scrolloff = 2

-- Colors for indents
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#414868 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#f7768e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#9ece6a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#e0af68 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#bb9af7 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#c0caf5 gui=nocombine]]

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}

-- Vimwiki stuff
vim.g.vimwiki_list = {
  {
    path = VIMWIKI_PATH,
    ext = '.md',
    syntax = 'markdown',
  }
}
vim.g.vimwiki_folding = "list"

vim.g.vimwiki_hl_headers = 1 -- use alternating colours for different heading levels
vim.g.vimwiki_global_ext = 0 --" don't treat all md files as vimwiki
vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
vim.g.taskwiki_markdown_syntax = "markdown"
vim.g.indentLine_conceallevel = 2 -- indentline controlls conceal

-- require("slanted-gaps")
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><Space>"] = ":set nohlsearch<cr>"
lvim.keys.normal_mode["<leader>n"] = ":tabnew<cr>"
lvim.keys.normal_mode["<leader>v"] = ":vsplit<cr>"
lvim.keys.normal_mode["<leader>W"] = "<C-w>w"
lvim.keys.normal_mode["<leader>t"] = ":TagbarToggle<cr>"
lvim.keys.normal_mode["<leader>h1"] = "yyp:s/./#/g<cr>"
lvim.keys.normal_mode["<leader>h1"] = "yyp:s/./#/g<cr>"
lvim.keys.normal_mode["<leader>h2"] = "yyp:s/./*/g<cr>"
lvim.keys.normal_mode["<leader>h3"] = "yyp:s/./=/g<cr>"
lvim.keys.normal_mode["<leader>h4"] = "yyp:s/./^/g<cr>"
lvim.keys.normal_mode["<leader>h5"] = "yyp:s/./\"/g<cr>"
lvim.keys.normal_mode["<leader>pp"] = ":set nolist nonumber paste mouse=<cr>"
lvim.keys.normal_mode["<leader>hb"] = ":tabnew<cr>:terminal<cr>icd ~/Development/template-testing-sphinx<cr>./build.sh<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "lua",
  "python",
  "yaml",
  "rst",
}

lvim.builtin.treesitter.ignore_install = { "haskell", "tex" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

--lvim.builtin.lualine.style = "default"
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { "diagnostics" },
  lualine_c = { "branch", "diff" },
  lualine_x = { "filename", "encoding", "fileformat", "filetype" },
  lualine_y = { components.spaces },
  lualine_z = { "progress", "location" },
}
lvim.builtin.lualine.options = {
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
  theme = "tokyonight"
}

-- Additional Plugins
lvim.plugins = {
  { "lukas-reineke/indent-blankline.nvim" },
  { "glepnir/zephyr-nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "aperezdc/vim-template" },
  { "folke/tokyonight.nvim" },
  { "vimwiki/vimwiki" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "eismog/vim-dmesg" },
  { "preservim/tagbar" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
