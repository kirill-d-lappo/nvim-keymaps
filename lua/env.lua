local M = {}

local function get_env_name()
    return os.getenv("LUA_ENVIRONMENT")
end

--- Checks if current environment is name
---@param name string
---@return boolean
function M.is_env(name)
    return get_env_name() == name
end

function M.is_dev()
    return M.is_env("Development")
end

function M.is_prod()
    local env_name = get_env_name()
    return env_name == "Production" or env_name == '' or env_name == nil
end

return M;