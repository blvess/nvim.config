local function set_working_directory()
	-- get the first argument provided to neovim
	local arg = vim.fn.argv(0)
	arg = tostring(arg)
	arg = arg:gsub([[oil://]], "", 1)
	-- check if the argument is a directory or a file
	if arg and vim.fn.isdirectory(arg) == 1 then
		-- if it's a directory, change the working directory to it
		vim.cmd("cd " .. arg)
	elseif arg and vim.fn.filereadable(arg) == 1 then
		-- if it's a file, change the working directory to its parent directory
		local file_dir = vim.fn.fnamemodify(arg, ":p:h")
		vim.cmd("cd " .. file_dir)
	end
end

-- create an autocommand group
vim.api.nvim_create_augroup("setcwd", { clear = true })
-- add an autocommand to the group that triggers on vimenter
vim.api.nvim_create_autocmd("vimenter", {
	group = "setcwd",
	callback = set_working_directory,
})
