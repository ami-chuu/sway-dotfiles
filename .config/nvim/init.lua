-- ~/.config/nvim/init.lua
-- Config by ami-chuu

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = vim.opt
local Plug = vim.fn['plug#']

-- General
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.wrap = false
opt.confirm = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = "split"

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Behavior & keymaps
opt.splitbelow = true
opt.splitright = true
opt.updatetime = 300
opt.timeoutlen = 300
opt.breakindent = true

local map = vim.keymap.set
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<C-h>", "<C-w><C-h>", { desc = "Window left" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Window down" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Window up" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Window right" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Plugins
vim.call('plug#begin')

Plug('rose-pine/vim')

vim.call('plug#end')

vim.cmd('silent! colorscheme rosepine')
