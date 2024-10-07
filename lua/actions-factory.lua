local M = {}

local function create_action(shortcut, func, metadata)
    local action = {
        shortcut = shortcut,
        func = func,
        description = metadata.desc,
        vim_modes = metadata.vim_modes,
    }

    return action
end

function M.create_group(name)

    local actions = {}

    local group = {
        name = name,
        add_action = function (shortcut, func, metadata)
            local action = create_action(shortcut, func, metadata)
            table.insert(actions, action)
        end,
        actions = actions,
    }

    return group
end

return M;