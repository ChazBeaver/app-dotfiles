--- @type LazyPluginSpec
return {
    "vimwiki/vimwiki",
    init = function ()
    vim.g.vimwiki_list = {
      {
        path = '/home/chaz/Documents/Notes/local',
        syntax = 'markdown',
        ext = '.md',
      },
      -- This is how you add another VimWiki index to reference
      -- Switch between existing indexes use: <leader>ws
      -- {
      --   path = '/Users/USERNAME/Documents/Notes/',
      --   syntax = 'markdown',
      --   ext = '.md',
      -- },
    }
    vim.g.vimwiki_diary_rel_path = 'Daily Notes/'
    vim.keymap.set("n", "<leader>wj", vim.cmd.VimwikiMakeDiaryNote)
end
}
