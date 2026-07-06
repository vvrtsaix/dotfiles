-- LSP / language tuning, layered on top of the LazyVim lang.* extras
-- (extras enabled in lazyvim.json: java, php, rust, go, typescript, ...)

return {
  ------------------------------------------------------------------
  -- Java (jdtls)
  ------------------------------------------------------------------
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- JVM tuning for the language server process itself.
      -- Mason's jdtls launcher forwards --jvm-arg= flags to the JVM.
      vim.list_extend(opts.cmd, {
        "--jvm-arg=-Xms1g",
        "--jvm-arg=-Xmx4g", -- heap ceiling; raise for very large monorepos
        "--jvm-arg=-XX:+UseParallelGC",
        "--jvm-arg=-XX:GCTimeRatio=4",
        "--jvm-arg=-XX:AdaptiveSizePolicyWeight=90",
        "--jvm-arg=-Dsun.zip.disableMemoryMapping=true",
      })

      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          -- Attach sources so go-to-definition lands in real code, not stubs
          eclipse = { downloadSources = true },
          maven = { downloadSources = true },
          references = { includeDecompiledSources = true },

          configuration = { updateBuildConfiguration = "interactive" },
          -- keep build output out of indexing/file-watching
          project = {
            resourceFilters = { "node_modules", "\\.git", "target", "build", "\\.gradle" },
          },
          autobuild = { enabled = true },
          maxConcurrentBuilds = 4,

          signatureHelp = { enabled = true, description = { enabled = true } },
          referencesCodeLens = { enabled = true },
          implementationsCodeLens = { enabled = true },
          inlayHints = { parameterNames = { enabled = "all" } },

          completion = {
            favoriteStaticMembers = {
              "org.junit.jupiter.api.Assertions.*",
              "org.junit.jupiter.api.Assumptions.*",
              "org.mockito.Mockito.*",
              "org.mockito.ArgumentMatchers.*",
              "org.assertj.core.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
            },
            filteredTypes = {
              "com.sun.*",
              "sun.*",
              "jdk.*",
              "org.graalvm.*",
              "io.micrometer.shaded.*",
            },
            importOrder = { "java", "javax", "jakarta", "org", "com" },
          },

          -- Never use star imports
          sources = {
            organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
          },

          codeGeneration = {
            useBlocks = true,
            hashCodeEquals = { useJava7Objects = true },
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
          },
        },
      })
    end,
  },

  ------------------------------------------------------------------
  -- PHP (intelephense; selected via vim.g.lazyvim_php_lsp in options.lua)
  ------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- no inlay hints by default (toggle per-session with <leader>uh)
      inlay_hints = { enabled = false },
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              telemetry = { enabled = false },
              -- default 1MB skips large vendor/generated files; index them too
              files = { maxSize = 5000000 },
              completion = {
                insertUseDeclaration = true,
                fullyQualifyGlobalConstantsAndFunctions = false,
              },
              phpdoc = { returnVoid = false },
            },
          },
        },
      },
    },
  },

  ------------------------------------------------------------------
  -- Rust (rust-analyzer via rustaceanvim)
  ------------------------------------------------------------------
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            -- extra's checkOnSave uses plain `cargo check`; clippy catches more
            check = { command = "clippy" },
          },
        },
      },
    },
  },
}
