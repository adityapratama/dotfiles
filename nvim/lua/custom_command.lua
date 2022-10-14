vim.api.nvim_create_user_command('JsFmt', '%! js-beautify - --type js', {})
vim.api.nvim_create_user_command('JsFmt', '%! js-beautify - --type html', {})
