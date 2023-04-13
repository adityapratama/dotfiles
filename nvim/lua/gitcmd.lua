local Job = require'plenary.job'
vim.notify = require("notify")
vim.notify.setup({ stages = 'slide' })

function GitCmd(cmd, is_origin)
  local args = { cmd }

  if is_origin == true then
    local branch = vim.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD"))

    args = vim.list_extend(args, { 'origin', branch })
  end


  local messages = {}

  Job:new({
    command = 'git',
    args = args,
    on_stdout = function(_, data, _)
      messages = vim.list_extend(messages, { data })
    end,
    on_stderr = function(_, data, _)
      messages = vim.list_extend(messages, { data })
    end,
    on_exit = function(_, _)
      vim.notify(messages)
    end
  }):start()
end

vim.api.nvim_create_user_command('GGpull', 'lua GitCmd("pull", true)', {})
vim.api.nvim_create_user_command('GGpush', 'lua GitCmd("push", true)', {})
vim.api.nvim_create_user_command('Gpull', 'lua GitCmd("pull")', {})
vim.api.nvim_create_user_command('Gpush', 'lua GitCmd("push")', {})
