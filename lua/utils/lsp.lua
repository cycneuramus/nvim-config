local get_glob_root = function(glob)
    local g = vim.glob.to_lpeg(glob)
    return vim.fs.root(0, function(fname)
        return g:match(fname) ~= nil
    end)
end

local M = {}

---@param globs string[]
---@return string?
M.root_globs = function(globs)
    for _, glob in ipairs(globs) do
        local match = get_glob_root(glob)
        if match ~= nil then
            return match
        end
    end
    return nil
end

return M
