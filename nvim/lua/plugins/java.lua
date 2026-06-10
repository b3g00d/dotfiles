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
        -- 1. Nếu user đã set JAVA_HOME trong shell (sdkman, asdf, manual) → dùng luôn
        local from_env = vim.env.JAVA_HOME
        if from_env and vim.fn.isdirectory(from_env) == 1 then
          return from_env
        end

        -- 2. Fallback: hỏi `java` binary đang active xem nó ở đâu
        local handle = io.popen "java -XshowSettings:property -version 2>&1 | grep 'java.home'"
        if handle then
          local result = handle:read "*a"
          handle:close()
          local path = result:match "java%.home%s*=%s*(.-)%s*$"
          if path and vim.fn.isdirectory(path) == 1 then
            return path
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
    end,
  },
}
