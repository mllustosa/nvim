local parsers = {
	"javascript",
	"typescript",
	"tsx",
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
}

local function get_filetypes()
	local filetypes = {}

	for _, parser in ipairs(parsers) do
		vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(parser))
	end

	return vim.list.unique(filetypes)
end

local function has_indent_query(buffer)
	local language = vim.treesitter.language.get_lang(vim.bo[buffer].filetype)

	return language and vim.treesitter.query.get(language, "indents") ~= nil
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(parsers)

		local group = vim.api.nvim_create_augroup("TreesitterConfig", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = get_filetypes(),
			callback = function(args)
				if pcall(vim.treesitter.start, args.buf) and has_indent_query(args.buf) then
					vim.bo[args.buf].indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
				end
			end,
		})
	end,
}
