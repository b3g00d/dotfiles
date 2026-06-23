return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    cond = function()
      return vim.fn.executable(vim.fn.stdpath "data" .. "/mason/bin/jdtls") == 1
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "MunifTanjim/nui.nvim",
      "JavaHello/spring-boot.nvim",
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    config = function()
      local function resolve_java_home()
        -- 1. JAVA_HOME shell set sẵn (sdk use per-project) → ưu tiên
        local from_env = vim.env.JAVA_HOME
        if from_env and vim.fn.isdirectory(from_env) == 1 then
          return from_env
        end

        -- 2. Suy thẳng từ `java` mà nvim nhìn thấy (bulletproof, không cần shell/env)
        local java_bin = vim.fn.exepath "java"
        if java_bin ~= "" then
          local resolved = vim.fn.resolve(java_bin) -- .../current/bin/java → .../21.0.5-tem/bin/java
          local home = vim.fn.fnamemodify(resolved, ":h:h") -- bỏ /bin/java → JAVA_HOME
          if vim.fn.isdirectory(home) == 1 then
            return home
          end
        end

        return nil
      end

      local java_home = resolve_java_home()
      if java_home then
        vim.env.JAVA_HOME = java_home
        vim.env.PATH = java_home .. "/bin:" .. vim.env.PATH
      else
        vim.notify("[nvim-java] JAVA_HOME not found, jdtls may fail", vim.log.levels.WARN)
      end

      require("java").setup { jdk = { auto_install = false } }
      vim.lsp.enable "jdtls"
      vim.lsp.config("jdtls", {
        settings = {
          java = {
            saveActions = { organizeImports = true },
          },
        },
      })
    end,
  },
}
