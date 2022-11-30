--[[
local nnoremap = require ("robert.keymap").nnoremap
local vnoremap = require ("robert.keymap").vnoremap
local inoremap = require ("robert.keymap").inoremap

nnoremap("<leader>pv", "<cmd>Ex<enter>") 

nnoremap("<F5>", function() require('dap').continue()end)
nnoremap("<F3>", function() require('dap').step_over()end)
nnoremap("<F2>", function() require('dap').step_into()end)
nnoremap("<F4>", function() require('dap').step_out()end)
nnoremap("<leader>b", function() require('dap').toggle_breakpoint()end)
nnoremap("<leader>B", function() require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: "))end)
nnoremap("<leader>lp", function() require('dap').set_breakpoint(nil,nil, vim.fn.input("Log point message: "))end)


local dapui = require('dapui')
local dap = require('dap')

dap.listeners.before.event_initialized["debug-config"] = function ()
    dapui.open()
end
dap.listeners.before.event_terminated["debug-config"] = function ()
    dapui.close()
end
dap.listeners.before.event_exited["debug-config"] = function ()
    dapui.close()
end
]]--
