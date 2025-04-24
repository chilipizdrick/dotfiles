return {
  "lervag/vimtex",

  ft = "tex",

  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-shell-escape",
        "-pvc",
        "-pdf",
        "-e '$pdflatex=q/xelatex -shell-escape %O %S/'",
      },
    }
    vim.g.Tex_IgnoredWarnings = "Package fontspec Warning"
  end,
}
