return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
        "CodeCompanion",
        "CodeCompanionActions",
        "CodeCompanionChat",
        "CodeCompanionCmd",
    },
    config = function()
        require("codecompanion").setup({
            adapters = {
                openrouter = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "https://openrouter.ai/api",
                            chat_url = "/v1/chat/completions",
                            api_key = "cmd:cat ~/.config/openai.token",
                        },
                        schema = {
                            model = {
                                default = "deepseek/deepseek-chat-v3-0324:free",
                                -- default = "google/gemini-2.5-pro-exp-03-25:free"
                            },
                        },
                    })
                end,
            },
            strategies = {
                chat = { adapter = "openrouter" },
                inline = { adapter = "openrouter" },
            },
        })
    end,
}
