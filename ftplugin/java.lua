-- ftplugin/java.lua
local jdtls_bin = vim.fn.stdpath('data') .. '/mason/bin/jdtls'

-- Search from the Java file, preferring multi-module roots over module build files.
local root = vim.fs.root(0, { 'gradlew', 'mvnw', 'settings.gradle', 'settings.gradle.kts', '.git' })
  or vim.fs.root(0, { 'pom.xml', 'build.gradle', 'build.gradle.kts' })
  -- For unmanaged folders without Git, start Neovim in the project root.
  or vim.fn.getcwd()

-- Use the project name plus a path hash so projects never share JDTLS data.
local ws = vim.fn.stdpath('data') .. '/jdtls-workspaces/'
  .. vim.fs.basename(root) .. '-' .. vim.fn.sha256(root):sub(1, 12)

-- Ensure Java is available to Neovim
-- (Set these if Neovim doesn't inherit your shell env)
-- vim.env.JAVA_HOME = '/Library/Java/JavaVirtualMachines/openjdk-25.jdk/Contents/Home'
-- vim.env.PATH = vim.env.JAVA_HOME .. '/bin:' .. vim.env.PATH

vim.lsp.start({
  name = 'jdtls',
  cmd = { jdtls_bin, '-data', ws },
  root_dir = root,
  settings = {
    java = {
      project = {
        -- Unmanaged projects only; Maven/Gradle define their own source paths.
        -- Use { 'src' } for project/src/Main.java.
        -- Change to { '.' } for project/Main.java.
        sourcePaths = { 'src' },
      },
    },
  },
  -- init_options = { bundles = { } }, -- add debug/test bundles if you use them
})
