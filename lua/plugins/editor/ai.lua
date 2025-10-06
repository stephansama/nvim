return { {
	"github/copilot.vim",
	cmd = { "Copilot" },
	init = function()
		vim.g.copilot_no_maps = true
	end,
	config = function()
		-- Block the normal Copilot suggestions
		vim.api.nvim_create_augroup("github_copilot", { clear = true })
		vim.api.nvim_create_autocmd(
			{ "FileType", "BufUnload" },
			{
				group = "github_copilot",
				callback = function(args)
					vim.fn["copilot#On" .. args.event]()
				end,
			}
		)
		vim.fn["copilot#OnFileType"]()
	end,
}, {
	"folke/sidekick.nvim",
	---@module 'sidekick'
	---@type sidekick.Config
	opts = {
		cli = {
			mux = {
				backend = "tmux",
				enabled = true,
			},
		},
	},
	-- stylua: ignore
	keys = { {
		"<tab>",
		function()
			-- if there is a next edit, jump to it, otherwise apply it if any
			if not require("sidekick").nes_jump_or_apply() then
				return "<Tab>" -- fallback to normal tab
			end
		end,
		expr = true,
		desc = "Goto/Apply Next Edit Suggestion",
	}, {
		"<leader>aa",
		function()
			require("sidekick.cli").toggle()
		end,
		desc = "Sidekick Toggle CLI",
	}, {
		"<leader>as",
		function()
			require("sidekick.cli").select()
		end,
		-- Or to select only installed tools:
		-- require("sidekick.cli").select({ filter = { installed = true } })
		desc = "Select CLI",
	}, {
		"<leader>at",
		function()
			require("sidekick.cli").send({ msg = "{this}" })
		end,
		mode = { "x", "n" },
		desc = "Send This",
	}, {
		"<leader>av",
		function()
			require("sidekick.cli").send({ msg = "{selection}" })
		end,
		mode = { "x" },
		desc = "Send Visual Selection",
	}, {
		"<leader>ap",
		function()
			require("sidekick.cli").prompt()
		end,
		mode = { "n", "x" },
		desc = "Sidekick Select Prompt",
	}, {
		"<c-.>",
		function()
			require("sidekick.cli").focus()
		end,
		mode = { "n", "x", "i", "t" },
		desc = "Sidekick Switch Focus",
	} },
} }
