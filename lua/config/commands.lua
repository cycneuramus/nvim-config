local usercmd = vim.api.nvim_create_user_command
usercmd("W", function()
    require("utils/sudo").write()
end, { bang = true })
