# cpp.py
# Copyright (C) 2020 Ben Tilley <targansaikhan@gmail.com>
#
# Distributed under terms of the MIT license.


"""
Helper utilities to format markdown snippets.
"""


def generate_comment_title(snip, title_match):
    star_banner = "*" * (len(title_match) + 4)
    snip.rv = f"/{star_banner}"
    snip += f" * {title_match} *"
    snip += f" {star_banner}/"
