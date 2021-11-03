local on_attach_java = function(client)
      require('jdtls').setup_dap()
      require('jdtls').setup.add_commands()
end

local bundles= {vim.fn.glob("/Users/philippe/Documents/Workspace/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")}
vim.list_extend(bundles, vim.split(vim.fn.glob("/Users/philippe/Documents/Workspace/java/vscode-java-test/server/*.jar"), "\n"))

function start_jdt()
    print("Starting jdt...")
    require('jdtls').start_or_attach({
    cmd = {'java_lsp.sh', '/Users/philippe/Documents/Workspace/java/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')},
    init_options = {
      bundles = bundles,
    },
    on_attach = function(client)
    on_attach_java(client)
    end
    })

end

-- java lsp
vim.api.nvim_exec([[
augroup lsp
au!
au FileType java lua start_jdt()
augroup end
    ]], false)
