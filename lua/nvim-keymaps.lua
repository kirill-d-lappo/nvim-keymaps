local default_groups = require("actions-defaults")
local factory = require("actions-factory")
local log = require("nvim-clerk")
local env = require("env")

if env.is_dev() then
    log.setup({
        config = {
            min_level = log.levels.DEBUG
        },
        create_writer = function(factory)
            return factory.create_nvim_plugin_file_writer("nvim-keymaps")
        end
    })
end

local M = {
    groups = default_groups
}

M.actions = factory

function M.add_group(name, setup)
    local group = factory.create_group(name)
    M.groups[name] = group

    setup(group)
    return group
end

function M.setup()
    local setup = require("actions-setup")

    setup.register_actions(M.groups)
end

return M;
