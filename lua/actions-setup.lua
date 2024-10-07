local log = require("nvim-clerk")

local M = {}

local map = vim.keymap.set;

function M.register_actions(groups)
    for _, group in pairs(groups) do
        for _, action in pairs(group.actions) do
            local modes = action.vim_modes
            local description = action.description
            local shortcut = action.shortcut
            local func = action.func

            local opts = {
                desc = description
            }

            log.info("Adding keymap [".. group.name .."]: '" .. description .. "' --> '" .. shortcut .. "'")

            map(modes, shortcut, func, opts)
        end
    end
end

return M;
