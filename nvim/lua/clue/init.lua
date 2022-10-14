-- DONE create scroll
-- DONE create select line
-- DONE create arrow current selected cursor
-- TODO create highlight selected line
-- TODO add search prompt
-- TODO search by plugin name
-- TODO read shortcuts from file & format it
local Clue = {}
Clue.__index = Clue 

-- local shortcuts = {"hello world", "this is second line", "and this is third line"}
local shortcuts = {
  { name="FZF", description="Open files", key="<leader>f"},
  { name="FZF", description="Open Ripgrep/rg", key="<leader>a"},
  { name="FZF", description="Open Ripgrep with word under cursor", key="<leader>A"},
  { name="FZF", description="Open buffers", key="<leader>p"},
  { name="Telescope", description="Open files", key="<space>f"},
  { name="Telescope", description="Open live grep with Ripgrep/rg", key="<space>a"},
  { name="Surround", description="Change sorround to \"", key="cs\""},
  { name="Org", description="Enter new TODO down", key="<leader>td"},
  { name="Org", description="Enter new TODO up", key="<leader>tu"},
  { name="Org", description="Change TODO to DONE", key="<leader>tx"},
  { name="Org", description="Rotate next TODO status", key="<leader>tn"},
  { name="Org", description="Rotate previous TODO status", key="<leader>tp"},
  { name="Org", description="Change TODO status with prompt", key="<leader>tc"},
  { name="Org", description="Org Clock In", key="<leader>ti"},
  { name="Org", description="Org Clock Out", key="<leader>to"},
  { name="Org", description="Enter new Org priority", key="<space>tt"},
  { name="Org", description="Rotate next Org priority", key="<space>tn"},
  { name="Org", description="Rotate previous Org priority", key="<space>tp"},
  { name="Org", description="Enter new heading down", key="<leader>hd"},
  { name="Org", description="Enter new heading up", key="<leader>hu"},
  { name="Org", description="Shift heading to right", key="<leader>hr"},
  { name="Org", description="Shift heading to left", key="<leader>hl"},
  { name="LSP", description="Code action normal&visual", key="<space>ca"},
  { name="LSP", description="Rename", key="<space>rn"},
  { name="LSP", description="Show line diasnostics", key="<space>e"},
  { name="LSP", description="Next diagnostics", key="]d"},
  { name="LSP", description="Previous diagnostics", key="]d"},
  { name="LSP", description="Hover", key="K"},
  { name="LSP", description="Signature help", key="gs"},
  { name="LSP", description="Goto Definition", key="gd"},
  { name="Surround", description="Change sorround to \"", key="cs\""},
}

function Clue:get_max_columns()
  local max_name_column = 0
  local max_description_column = 0
  local max_key_column = 0

  for _,text in ipairs(self.shortcuts) do
    if #(text.name) > max_name_column then
      max_name_column = #(text.name)
    end

    if #(text.description) > max_description_column then
      max_description_column = #(text.description)
    end

    if #(text.key) > max_key_column then
      max_key_column = #(text.key)
    end
  end

  return {
    name=max_name_column,
    description=max_description_column,
    key=max_key_column
  }
end

function Clue.greeting()
  print("Greeting from clue.vim")
end

function Clue:new(opts)
  opts = opts or {}

  local width = opts.width or 80
  local height = opts.height or 30

  local object = setmetatable({
    width=width,
    height=height,
    shortcuts=shortcuts,
    first_shortcuts_index=0,
  }, self)

  return object
end

-- Colon atau : adalah syntastic sugar dari M.create_lines(self)
function Clue:create_lines()
  local width = self.width
  local height = self.height
  local shortcuts = self.shortcuts
  local first_shortcuts_index = self.first_shortcuts_index
  local max_columns = self:get_max_columns()

  -- start of content
  -- { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
  local lines = {}
  local line = "╭"
  for i=2,(width-1) do
    line = line.."─"
  end
  line = line.."╮"
  table.insert(lines, line)

  for i=2+first_shortcuts_index,(height-1)+first_shortcuts_index do
    local line = "│ "

    -- disable, since we not select line
    -- if i-1 == selected_line then
      -- line = line .. ">"
    -- else
      -- line = line .. " "
    -- end

    -- #shortcuts syntastic sugar dari table.getn(tbl)
    -- atau mendapatkan lenght dari sebuah table
    if i-1 < #shortcuts then
      raw_name = shortcuts[i-1].name 
      raw_description = shortcuts[i-1].description 
      raw_key = shortcuts[i-1].key

      name = raw_name .. string.rep(" ", max_columns.name - #raw_name)
      -- description = raw_description .. string.rep(" ", max_columns.description - #raw_description)
      key = raw_key .. string.rep(" ", max_columns.key - #raw_key)

      text = name .. " │ " .. key .. " │ " .. raw_description 
      line = line .. text

      -- line_text = line
      -- #shortcuts[index] systastic sugar dari string.len(str) 
      -- atau mendapatkan lenght dari sebuah string 
      -- TODO use string.rep(...)
      -- TODO use line_text instead #shortcuts[i-1], width-5
      -- for _=1, width-#text do
        -- line = line .. " "
      -- end
      line = line .. string.rep(" ", width-#text)
    else
      -- for j=2,(width-2) do
        -- line = line .. " "
      -- end
      line = line .. string.rep(" ", max_columns.name) .. " │ " .. string.rep(" ", max_columns.key) .. " │ " 
      line = line .. string.rep(" ", width-(#line-5))
    end
    line = line.." │"
    table.insert(lines, line)
  end

  line = "╰"
  for i=2,(width-1) do
    line = line.."─"
  end
  line = line.."╯"
  table.insert(lines, line)
  -- end off content

  return lines
end

function Clue:create_popup()
  local bufnr = vim.api.nvim_create_buf(false, true)
  self.bufnr = bufnr
  -- vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')

  -- Digunakan untuk membuat buffer bertype prompt
  -- contoh: prompt di Telescope.vim
  -- :h buftype
  -- vim.api.nvim_buf_set_option(bufnr, 'buftype', 'prompt')
  -- vim.fn.prompt_setprompt(bufnr, "> ")

  -- vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")

  local editor = vim.api.nvim_list_uis()[1]

  local lines = self:create_lines()
  -- vim.api.nvim_buf_set_text(bufnr, 0, 0, 0, 0, {"hello world", "this is second line", "and this is third line"})
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

  -- :h nvim_open_win
  -- relative
  -- editor: diukur dari editor
  -- win: diukur dair window
  -- cursor: diukur dari posisi cursor
  -- col & row jarak floating window dari editor atau win
  local opts = {
    relative = 'editor',
    width = self.width,
    height = self.height,
    col = (editor.width/2) - (self.width/2),
    row = (editor.height/2) - (self.height/2),
    style = 'minimal'
  }

  local win_id = vim.api.nvim_open_win(bufnr, 1, opts)
  
  -- https://github.com/nvim-telescope/telescope.nvim/blob/HEAD/lua/telescope/pickers.lua#320
  vim.api.nvim_win_set_option(win_id, 'winhl', 'Normal:MyshortcutNormal')
  -- vim.api.nvim_win_set_option(win_id, 'winblend', 20)


  -- Virtual Text: Menampilkan virtual text seperti status di Telescope.vim prompt
  -- local clue_namespace = vim.api.nvim_create_namespace("clue")
  -- vim.api.nvim_buf_clear_namespace(bufnr, clue_namespace, 0, 1)
  -- vim.api.nvim_buf_set_virtual_text(bufnr, clue_namespace, 0, { {"   Test", "NonText"} }, {} )


  -- TODO: cari tahu kegunaan ini, nyontek dari popoup.vim & plenary
  -- local try_close = function(win_id)
    -- print("try_close...")
    -- pcall(vim.api.nvim_win_close, win_id, true)
  -- end
  -- vim.cmd(
    -- string.format(
      -- "autocmd BufDelete %s <buffer=%s> ++once ++nested :lua try_close(%s, true)",
      -- "<silent>",
      -- bufnr,
      -- win_id
    -- )
  -- )

  -- vim.api.nvim_win_set_option(win_id, 'cursorline', true)
  
  -- TODO clear all popup buffers after hit <Esc>, since now the buffer still active
  -- escape untuk close
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", { silent=true, noremap=true })
  
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", ":lua require('clue').scroll_down()<CR>", { silent=true, noremap=true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-p>", ":lua require('clue').scroll_up()<CR>", { silent=true, noremap=true })

  -- print(vim.inspect(lines))
end


-- M.create_popup(shortcuts)

-- return M

local clueCache = {}

local clue = {}

function clue.new()
  clueCache = Clue:new()
  clueCache:create_popup()
end

local shortcuts_start_index = 1

function clue.scroll_down()
  if #clueCache.shortcuts - clueCache.first_shortcuts_index == clueCache.height - 1 then
    return
  end

  clueCache.first_shortcuts_index = clueCache.first_shortcuts_index + 1

  local lines = clueCache:create_lines()
  vim.api.nvim_buf_set_lines(clueCache.bufnr, 0, -1, true, lines)
end

function clue.scroll_up()
  if clueCache.first_shortcuts_index == 0 then
    return
  end

  clueCache.first_shortcuts_index = clueCache.first_shortcuts_index - 1

  local lines = clueCache:create_lines()
  vim.api.nvim_buf_set_lines(clueCache.bufnr, 0, -1, true, lines)
end

local selected_line = 1

function clue.select_next_row()
  if selected_line == #shortcuts then
    unselected_line = selected_line
    selected_line = 1
  else
    unselected_line = selected_line 
    selected_line = selected_line + 1
  end

  vim.api.nvim_buf_set_text(bufnr, unselected_line, 4, unselected_line, 5, { " " })
  vim.api.nvim_buf_set_text(bufnr, selected_line, 4, selected_line, 5, { ">" })
end

function clue.select_previous_row()
  if selected_line == 1 then
    unselected_line = 1
    selected_line = #shortcuts
  else
    unselected_line = selected_line 
    selected_line = selected_line - 1
  end

  vim.api.nvim_buf_set_text(bufnr, unselected_line, 4, unselected_line, 5, { " " })
  vim.api.nvim_buf_set_text(bufnr, selected_line, 4, selected_line, 5, { ">" })
end

return clue
