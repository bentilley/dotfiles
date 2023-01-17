;; highlights.scm
;; Author: Ben Tilley
;; Created: 2022-09-20
;; Custom Python Highlights for Treesitter
;;
;; extends

;; add comment highlight group to docstrings
(expression_statement (string) @comment)
