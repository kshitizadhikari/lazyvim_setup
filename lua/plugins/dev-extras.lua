return {
  -- Snippets: friendly-snippets + React/Redux/GraphQL snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
