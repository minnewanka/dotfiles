local ok, jdtls = pcall(require, "jdtls")
if not ok then
	return
end

-- multi-module markers first so submodule poms don't split one project into many roots
local root_dir = vim.fs.root(0, { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git" })
	or vim.fs.root(0, { "pom.xml", "build.gradle", "build.gradle.kts" })
if not root_dir then
	return
end

local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local cmd = {
	"jdtls",
	"--jvm-arg=-Xmx2g",
	"-data",
	workspace_dir,
}

local lombok_jar = vim.fn.expand("~/.local/share/java/lombok.jar")
if vim.uv.fs_stat(lombok_jar) then
	table.insert(cmd, 2, "--jvm-arg=-javaagent:" .. lombok_jar)
end

local capabilities = nil
local blink_ok, blink = pcall(require, "blink.cmp")
if blink_ok then
	capabilities = blink.get_lsp_capabilities()
end

jdtls.start_or_attach({
	cmd = cmd,
	root_dir = root_dir,
	capabilities = capabilities,
	settings = {
		java = {
			configuration = {
				updateBuildConfiguration = "automatic",
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "/Users/Pro/.sdkman/candidates/java/8.0.472-amzn",
					},
					{
						name = "JavaSE-11",
						path = "/Users/Pro/.sdkman/candidates/java/11.0.29-amzn",
					},
					{
						name = "JavaSE-17",
						path = "/Users/Pro/.sdkman/candidates/java/17.0.17-amzn",
						default = true,
					},
					{
						name = "JavaSE-21",
						path = "/Users/Pro/.sdkman/candidates/java/21.0.9-amzn",
					},
				},
			},
			maven = { downloadSources = true },
			references = { includeDecompiledSources = true },
			completion = {
				favoriteStaticMembers = {
					"org.assertj.core.api.Assertions.*",
					"org.mockito.Mockito.*",
					"org.junit.jupiter.api.Assertions.*",
				},
			},
		},
	},
})
