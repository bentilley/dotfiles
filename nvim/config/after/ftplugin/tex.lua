-- tex.lua
-- Author:  Ben Tilley
-- Created: 2022-10-27
-- Tex specific setup

-- boolean options

vim.opt_local.spell = true

-- non-boolean options

vim.bo.makeprg = "latexmk -pdf -pv"
