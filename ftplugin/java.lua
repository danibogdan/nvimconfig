-- ftplugin/java.lua
local jdtls_bin = vim.fn.stdpath('data') .. '/mason/bin/jdtls'

-- Find project root
local root_markers = { 'gradlew', 'mvnw', 'pom.xml', 'build.gradle', '.git' }
local root = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1]) or vim.loop.cwd()

-- Unique workspace dir per project
local ws = vim.fn.stdpath('data') .. '/jdtls-workspaces/' .. vim.fn.fnamemodify(root, ':p:h:t')

-- Ensure Java is available to Neovim
-- (Set these if Neovim doesn't inherit your shell env)
-- vim.env.JAVA_HOME = '/Library/Java/JavaVirtualMachines/openjdk-25.jdk/Contents/Home'
-- vim.env.PATH = vim.env.JAVA_HOME .. '/bin:' .. vim.env.PATH

vim.lsp.start({
  name = 'jdtls',
  cmd = { jdtls_bin, '-data', ws },
  root_dir = root,
  -- settings = { ... },
  -- init_options = { bundles = { } }, -- add debug/test bundles if you use them
})
