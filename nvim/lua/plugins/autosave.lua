require("autosave").setup (
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave","FocusLost","BufLeave"},
        conditions = {
            exists = true,
            filetype_is_not = {'fugitive'},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 2500
    }
)
