local expand_keymaps = require("utils").expand_keymaps

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	config = function()
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
				.new(require("telescope.themes").get_dropdown({}), {
					prompt_title = "Harpoon",
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					finder = require("telescope.finders").new_table({ results = file_paths }),
				})
				:find()
		end

		local harpoon_list = function()
			toggle_telescope(harpoon:list())
		end

		local harpoon_select = function(number)
			local buffer_name = "buffer " .. number
			return {
				function()
					harpoon:list():select(number)
					print("Switched to " .. buffer_name)
				end,
				"Select harpoon " .. buffer_name,
			}
		end

		local harpoon_modify = function(direction)
			local description = string.upper(direction)
				.. " "
				.. ((direction == "append") and "to" or "from")
				.. " harpoon"
			local action = function()
				if direction == "append" then
					harpoon:list():append()
				else
					harpoon:list():remove()
				end
			end
			return {
				function()
					action()
					print(description)
				end,
				description,
			}
		end

		expand_keymaps({
			n = {
				["<leader>R"] = harpoon_modify("remove"),
				["<leader>a"] = harpoon_modify("append"),
				["<leader>p"] = { harpoon_list, "Open harpoon list" },
				["<leader>1"] = harpoon_select(1),
				["<leader>2"] = harpoon_select(2),
				["<leader>3"] = harpoon_select(3),
				["<leader>4"] = harpoon_select(4),
			},
		})
	end,
}
