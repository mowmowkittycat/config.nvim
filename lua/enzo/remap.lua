local nnoremap = require("enzo.keymap").nnoremap
local inoremap = require("enzo.keymap").inoremap
nnoremap("<C-B>", "<cmd>NvimTreeFocus<CR>")

nnoremap("<C-t>", "<cmd>ToggleTerm<CR>")

vim.cmd [[ tnoremap <Esc> <C-\><C-n> ]]
