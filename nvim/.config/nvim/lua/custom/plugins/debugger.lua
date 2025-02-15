return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'leoluz/nvim-dap-go',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- This doesn't work, I'll keep it for future reference
      -- vim.keymap.set('n', '<Leader>dt', ':DapUiToggle<CR>', { noremap = true })

      vim.keymap.set('n', '<Leader>db', ':DapToggleBreakpoint<CR>', { noremap = true })
      vim.keymap.set('n', '<Leader>dc', ':DapContinue<CR>', { noremap = true })
      vim.keymap.set('n', '<Leader>dx', ':DapTerminate<CR>', { noremap = true })
      vim.keymap.set('n', '<Leader>dr', ":lua require('dapui').open({reset = true})<CR>", { noremap = true })

      vim.fn.sign_define('DapBreakpoint', { text = '⏺', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    end,
  },
}
