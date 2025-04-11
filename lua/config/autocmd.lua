local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
    group = augroup("highlight_yank"),
    desc = "Highlight text on yank",
})

autocmd({ "InsertLeave", "WinEnter" }, {
    command = "set cursorline",
    group = augroup("cursorline_on"),
    desc = "Show cursorline only in active window",
})

autocmd({ "InsertEnter", "WinLeave" }, {
    command = "set nocursorline",
    group = augroup("cursorline_off"),
    desc = "Show cursorline only in active window",
})

autocmd("VimResized", {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
    group = augroup("resize_splits"),
    desc = "Resize splits on window resize",
})

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
    group = augroup("checktime"),
    desc = "Check if we need to reload the file on change",
})

autocmd("BufReadPost", {
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].custom_last_loc then
            return
        end
        vim.b[buf].custom_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
    group = augroup("last_loc"),
    desc = "Go to last loc when opening a buffer",
})

-- Shift numbered registers up (1 becomes 2, etc.)
local function yank_shift()
    for i = 9, 1, -1 do
        vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
    end
end

autocmd("TextYankPost", {
    callback = function()
        local event = vim.v.event
        if event.operator == "y" then
            yank_shift()
        end
    end,
    group = augroup("yank_ring"),
    desc = "Save yanks to registers 1..9, as with deletes",
})

autocmd("FileType", {
    pattern = {
        "fzf",
        "help",
        "lazy",
        "mason",
        "nofile",
        "notify",
        "terminal",
        "toggleterm",
        "trouble",
        "Trouble",
    },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
    group = augroup("indentscope_disable"),
    desc = "Disable indentscope on certain filetypes",
})
