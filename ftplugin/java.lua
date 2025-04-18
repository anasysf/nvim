local ok, jdtls = pcall(require, 'jdtls')
if not ok then
	return vim.notify('COULD NOT LOAD NVIM-JDTLS', vim.log.levels.ERROR, { title = 'NVIM-JDTLS' })
end

local utils_ok, utils = pcall(require, 'ayem.utils')
if not utils_ok then
	return vim.notify('COULD NOT LOAD UTILS', vim.log.levels.ERROR, { title = 'UTILS' })
end

local on_attach_ok, on_attach = pcall(require, 'ayem.nvim-lspconfig.utils.on_attach')
if not on_attach_ok then
	return vim.notify('COULD NOT LOAD ON ATTACH', vim.log.levels.ERROR, { title = 'ON ATTACH' })
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then
	return vim.notify(
		'COULD NOT LOAD CMP_NVIM_LSP',
		vim.log.levels.ERROR,
		{ title = 'CMP_NVIM_LSP' }
	)
end

local data_dir = vim.fn.stdpath 'data'
local mason_packages_dir = data_dir .. '/mason/packages'
local jdtls_dir = mason_packages_dir .. '/jdtls'
local launcher_jar = vim.fn.glob(jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_*.jar')

local workspace_dir = 'C:\\Users\\elmahdad\\Documents\\projects\\java-workspace\\'

-- local java = (utils.is_win32() and 'C:\\Program Files\\Java\\jdk-21\\bin\\java.exe' or 'java')

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		-- 💀
		'java', -- or '/path/to/java21_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-javaagent:' .. jdtls_dir .. '/lombok.jar',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens',
		'java.base/java.util=ALL-UNNAMED',
		'--add-opens',
		'java.base/java.lang=ALL-UNNAMED',

		-- 💀
		'-jar',
		launcher_jar,
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		'-configuration',
		jdtls_dir .. '/config_' .. (utils.is_win32() and 'win' or 'linux'),
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		'-data',
		workspace_dir .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
	},

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	--
	-- vim.fs.root requires Neovim 0.10.
	-- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
	root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew', 'pom.xml' }),

	on_attach = on_attach,
	capabilities = capabilities,

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	-- settings = {},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = { extendedClientCapabilities = jdtls.extendedClientCapabilities },
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
