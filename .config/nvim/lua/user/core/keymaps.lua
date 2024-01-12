local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- set leader key to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keybindings --
-- Modes
--   normal_mode       = 'n'
--   insert_mode       = 'i'
--   visual_mode       = 'v'
--   visual_block_mode = 'x'
--   terminal_mode     = 't'
--   command_mode      = 'c'

-- Super Keys --
--   Leader  = '<leader>'
--   Enter   = '<CR>'
--   Control = '<C>'
--   Shift   = '<S>'
--   Alt     = '<A>'

-- keymap({mode}, {keymap}, {mapped to}, {options})

-- Normal Mode --
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Keymaps for terminal mode navigation
-- Open a vertical split terminal to the right and enter insert mode
keymap("n", "<leader>tt", ":vsplit term://bash<CR>i", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)

-- Resize Splits with Alt + Arrow Key
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)
-- Spellcheck On/Off
keymap("n", "<leader>s", ":setlocal spell!<CR>", opts)
-- Alias to replace
keymap("n", "<S-s>", ":%s///g<Left><Left><Left>", opts)
-- Remove highlighting
keymap("n", "<leader>nh", ":nohl<CR>", opts)
-- Undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", opts)
-- Buffer Tabs
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
-- Create a vertical split and open a file
keymap("n", "<leader>vs", ":vsplit<CR>:e ", opts)

-- Visual Mode --
-- Move Text Blocks Left/Right (Shift + </>)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "<A-Up>", ":m .+1<CR>==", opts)
keymap("v", "<A-Down>", ":m .-2<CR>==", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
