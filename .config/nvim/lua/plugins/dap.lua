return {
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function()
            require("dap-go").setup()
        end,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("dapui").setup()
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<leader>dc", dap.continue, {})
            vim.keymap.set("n", "<leader>do", dap.step_over, {})
            vim.keymap.set("n", "<leader>di", dap.step_into, {})
            vim.keymap.set("n", "<leader>du", dap.step_out, {})
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
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason").setup()
            require("mason-nvim-dap").setup({
                automatic_installation = true,
                handlers = {},
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
        config = function()
            --remap dap continue to RustLsp Debuggables
            vim.keymap.set("n","<leader>dd", "<cmd>RustLsp debuggables<CR>")
        end,
    },
}
