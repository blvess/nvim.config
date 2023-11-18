local function set_working_directory()
	-- Get the first argument provided to Neovim
	local arg = vim.fn.argv(0)

	-- Check if the argument is a directory or a file
	if arg and vim.fn.isdirectory(arg) == 1 then
		-- If it's a directory, change the working directory to it
		vim.cmd("cd " .. arg)
	elseif arg and vim.fn.filereadable(arg) == 1 then
		-- If it's a file, change the working directory to its parent directory
		local file_dir = vim.fn.fnamemodify(arg, ":p:h")
		vim.cmd("cd " .. file_dir)
	end
end

-- Create an autocommand group
vim.api.nvim_create_augroup("setcwd", { clear = true })
-- Add an autocommand to the group that triggers on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
	group = "setcwd",
	callback = set_working_directory,
})
