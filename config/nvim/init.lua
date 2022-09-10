-- Constants
local TAB_WIDTH = 2

require("plugins")
local utils = require("utils")

local opt = vim.opt

vim.g.mapleader = " "

opt.tabstop = TAB_WIDTH
opt.softtabstop = TAB_WIDTH
opt.shiftwidth = TAB_WIDTH
opt.expandtab = true

opt.listchars = {eol = '↵', tab = '| '}
opt.list = true

-- Line number settings.
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- Set signcolumn width to 3.
vim.opt.signcolumn = "yes:3"

-- Enable mouse in all modes.
opt.mouse = "a"

-- (Re)maps
utils.nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
utils.nnoremap("<C-b>", "<cmd>NvimTreeToggle<cr>")
-- Harpoon maps
utils.nnoremap("<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
utils.nnoremap("<leader>hg", "<cmd>lua require('harpoon.mark').add_file()<cr>")

-- Color scheme
vim.o.termguicolors = true
require('monokai').setup { palette = require('monokai').pro }

vim.cmd[[highlight Normal ctermbg=none]]
vim.cmd[[highlight NonText ctermbg=none]]
vim.cmd[[highlight Normal guibg=none]]
vim.cmd[[highlight NonText guibg=none]]
vim.cmd[[highlight LineNr guibg=none]]
vim.cmd[[highlight clear SignColumn]]


require('lualine').setup()

