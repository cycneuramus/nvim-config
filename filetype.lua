local ansible_dirs = {
    "defaults",
    "host_vars",
    "group_vars",
    "playbooks",
    "roles/.*/tasks",
    "roles/.*/handlers",
    "tasks",
    "molecule",
}

local ansible_patterns = {
    -- YAML files in paths containing "ansible" as a directory name
    ["/[^/]*ansible[^/]*/.*%.ya?ml"] = "yaml.ansible",
    ["/playbook.*%.ya?ml"] = "yaml.ansible",
}

for _, dir in ipairs(ansible_dirs) do
    ansible_patterns[dir .. "/.*%.ya?ml"] = "yaml.ansible"
end

vim.filetype.add({
    extension = {
        env = "dotenv",
    },
    filename = {
        [".env"] = "dotenv",
    },
    pattern = vim.tbl_extend("force", {
        ["Caddyfile.*"] = "caddy",
        [".*.y.?ml.*"] = "yaml",
        [".*/waybar/config"] = "jsonc",
        [".*/mako/config"] = "dosini",
        [".*/isyncrc"] = "config",
        [".*/dunstrc"] = "dosini",
        [".*/kitty/.+%.conf"] = "kitty",
        ["%.env%.[%w_.-]+"] = "dotenv",
        ["docker%-compose%.y.?ml"] = "yaml.docker-compose",
    }, ansible_patterns),
})
