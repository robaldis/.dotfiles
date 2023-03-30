local nnoremap = require ("robert.keymap").nnoremap

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<leader>qs", function()
    require('telescope.builtin').setqflist(require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
)
end)

nnoremap("<leader>pf", function() 
    require('telescope.builtin').find_files()
end)

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
