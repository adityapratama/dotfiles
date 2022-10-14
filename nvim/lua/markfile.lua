function markfile()
    local home = os.getenv('HOME')
    local markfile, err = io.open(home..'/.config/markfile/marks','w')
    if markfile then
        local current_file = vim.fn.expand('%:p')

        print('mark:', current_file)

        markfile:write(current_file)
        markfile:close()
    else
        print('error:', err)
    end
end

vim.api.nvim_create_user_command('Markfile', 'lua markfile', {})
