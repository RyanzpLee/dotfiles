local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- diagnostics
  b.diagnostics.eslint_d,
  b.diagnostics.markdownlint,

  -- webdev stuff
  -- b.formatting.deno_fmt,                                                         -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettierd.with({ filetypes = { "html", "css", "scss", "less", "graphql" } }), -- so prettier works only on these filetypes
  b.formatting.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- rust
  b.formatting.rustfmt,

  -- cpp
  b.formatting.clang_format,

  -- Shell
  b.formatting.shfmt,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
