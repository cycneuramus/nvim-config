vim.filetype.add({
    extension = {
        env = "dotenv",
    },
    filename = {
        [".env"] = "dotenv",
    },
    pattern = {
        ["Caddyfile%.?tpl?"] = "caddy",
        [".*/waybar/config"] = "jsonc",
        [".*/mako/config"] = "dosini",
        [".*/dunstrc"] = "dosini",
        [".*/kitty/.+%.conf"] = "kitty",
        ["%.env%.[%w_.-]+"] = "dotenv",
        ["docker%-compose%.y.?ml"] = "yaml.docker-compose",
        [".*/[^/]*ansible[^/]*/.*%.ya?ml"] = "yaml.ansible",
        [".*/defaults/.*%.y.?ml"] = "yaml.ansible",
        [".*/host_vars/.*%.y.?ml"] = "yaml.ansible",
        [".*/group_vars/.*"] = "yaml.ansible",
        [".*/playbook.*%.y.?ml"] = "yaml.ansible",
        [".*/playbooks/.*%.y.?ml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.y.?ml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.y.?ml"] = "yaml.ansible",
        [".*/tasks/.*%.y.?ml"] = "yaml.ansible",
        [".*/molecule/.*%.y.?ml"] = "yaml.ansible",
    },
})
