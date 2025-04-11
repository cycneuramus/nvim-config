local M = {}

local function fast_event_aware_notify(msg, level, opts)
    if vim.in_fast_event() then
        vim.schedule(function()
            vim.notify(msg, level, opts)
        end)
    else
        vim.notify(msg, level, opts)
    end
end

function M.info(msg)
    fast_event_aware_notify(msg, vim.log.levels.INFO, {})
end

function M.warn(msg)
    fast_event_aware_notify(msg, vim.log.levels.WARN, {})
end

function M.err(msg)
    fast_event_aware_notify(msg, vim.log.levels.ERROR, {})
end

return M
