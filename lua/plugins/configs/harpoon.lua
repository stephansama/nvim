local M = {}

M.config = function()
	local harpoon = require("harpoon")
	harpoon:setup({})

	-- basic telescope configuration
	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers")
			.new({}, {
				prompt_title = "Harpoon",
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
				finder = require("telescope.finders").new_table({ results = file_paths }),
			})
			:find()
	end

	vim.keymap.set("n", "<leader>h", function()
		toggle_telescope(harpoon:list())
	end, { desc = "Open harpoon window" })

	vim.keymap.set("n", "<leader>r", function()
		harpoon:list():remove()
	end, { desc = "Remove from harpoon" })

	vim.keymap.set("n", "<leader>a", function()
		harpoon:list():append()
	end, { desc = "Append to harpoon" })
	-- vim.keymap.set("n", "<C-e>", function()
	-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
	-- end)

	vim.keymap.set("n", "<leader>1", function()
		harpoon:list():select(1)
	end, { desc = "Select harpoon buffer 1" })
	vim.keymap.set("n", "<leader>2", function()
		harpoon:list():select(2)
	end, { desc = "Select harpoon buffer 2" })
	vim.keymap.set("n", "<leader>3", function()
		harpoon:list():select(3)
	end, { desc = "Select harpoon buffer 3" })
	vim.keymap.set("n", "<leader>4", function()
		harpoon:list():select(4)
	end, { desc = "Select harpoon buffer 4" })

	-- Toggle previous & next buffers stored within Harpoon list
	vim.keymap.set("n", "<leader>`", function()
		harpoon:list():prev()
	end, { desc = "Select prev harpoon buffer" })
	vim.keymap.set("n", "<leader><Taharpoon b>", function()
		harpoon:list():next()
	end, { desc = "Select next harpoon buffer" })
end

return M
