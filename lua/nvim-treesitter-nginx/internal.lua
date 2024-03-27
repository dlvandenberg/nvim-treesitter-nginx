local parsers = require("nvim-treesitter.parsers")
local installer = require("nvim-treesitter.install")

local M = {}

-- ╭─────────────────────────────────────────────────────────╮
-- │ Init plugin                                             │
-- ╰─────────────────────────────────────────────────────────╯
function M.init()
	parsers.get_parser_configs().nginx = {
		install_info = {
			url = "https://gitlab.com/joncoole/tree-sitter-nginx",
			files = { "src/parser.c" },
			branch = "main",
		},
		maintainers = { "@joncoole" },
	}

	-- Install parser if not already installed ────────────────
	if not parsers.has_parser("nginx") then
		installer.update("nginx")
	end
end

return M
