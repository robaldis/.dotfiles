local ts_utils = require('nvim-treesitter.ts_utils')

local get_line_for_node = function(node, type_patterns, transform_fn)
  local node_type = node:type()
  local is_valid = false
  for _, rgx in ipairs(type_patterns) do
    if node_type:find(rgx) then
      is_valid = true
      break
    end
  end
  if not is_valid then return '' end
  local line = transform_fn(vim.trim(ts_utils.get_node_text(node)[1] or ''))
  -- Escape % to avoid statusline to evaluate content as expression
  return line:gsub('%%', '%%%%')
end

local get_function = function (node)
    local bufnr = vim.api.nvim_get_current_buf()

    local parent = node
    while parent do
        if parent:type() == 'method_declaration' then
            break
        end
        parent = parent:parent()
    end

    if not parent then return "" end

    for local_node in parent:iter_children() do
        if (local_node:type() == "identifier") then
            print(local_node:sexpr())
            node = local_node
        end
    end
    local start_r, start_c = node:start()
    local end_r, end_c = node:end_()

    local name = vim.api.nvim_buf_get_text(bufnr, start_r, start_c, end_r, end_c, {})[1]

    return name
end

-- Trim spaces and opening brackets from end
local transform_line = function(line)
  return line:gsub('%s*[%[%(%{]*%s*$', '')
end

local type_patterns = {'class', 'function', 'method'}
local transform_fn = transform_line

local function hello()
    local current_node = ts_utils.get_node_at_cursor()
    if not current_node then return "" end
    local expr = current_node

    while expr do
        local line = get_function(expr)
        if line ~= '' then
            return line
        end
        expr = expr:parent()
    end
    return ""
end


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_c = {hello},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
