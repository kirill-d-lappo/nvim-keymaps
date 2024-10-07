local cmd = vim.cmd;

local factory = require("actions-factory")
local system = factory.create_group("system")

system.add_action("<C-s>", function() cmd('wa') end, { desc = "Save all buffers", vim_modes = {"n", "v", "i"}})

system.add_action("<C-x>", function() cmd('x') end, { desc = "Cut", vim_modes = {"n", "v", "i"}})
system.add_action("<C-c>", function() cmd('y') end, { desc = "Copy", vim_modes = {"n", "v", "i"}})

system.add_action("<M-q>", function() cmd('q') end, { desc = "Exit", vim_modes = {"n", "v", "i"}})

return {
    system
}