local nnoremap = require ("robert.keymap").nnoremap
local Job = require('plenary.job')

local silent = { silent = true }


nnoremap("<leader>yd", "<cmd>ObsidianYesterday<CR>", silent)
nnoremap("<leader>td", "<cmd>ObsidianToday<CR>", silent)
nnoremap("<leader>tm", "<cmd>ObsidianTomorrow<CR>", silent)

nnoremap("<leader>fl", "<cmd>ObsidianFollowLink<CR>", silent)

nnoremap("<leader>tn", function ()
    -- This needs to be changed to the config version so it can be used on other computers
    vim.cmd("e /Users/robertaldis/Library/CloudStorage/OneDrive-FinbourneTechnologyLimited/BrainDump/BrainDump/" .. GetTaskFromBranch() .. ".md");
end, silent)



function GetTaskFromBranch()
    -- Trigger command to get the current branch
    local job = Job:new({
      command = 'git',
      args = { 'branch', '--show-current'},
    })
    job:sync()

    -- String the rest of the path and just the main feature task
    local job2 = Job:new({
      command = 'basename',
      args = { job:result()[1] },
    })
    job2:sync()
    local branch = job2:result()[1]

    -- Strip out any suffix on the task
    local t = {}
    for str in string.gmatch(branch, "([^.]+)") do
        table.insert(t, str)
    end
    return t[1]
end
