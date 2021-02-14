# gitcommit.py
# Copyright (C) 2021 Ben Tilley <targansaikhan@gmail.com>
#
# Distributed under terms of the MIT license.


TYPE_DESCRIPTION = {
    "build": "Changes that affect the build system or external dependencies",
    "ci": "Changes to our CI configuration files and scripts",
    "docs": "Documentation only changes",
    "feat": "A new feature",
    "fix": "A bug fix",
    "perf": "A code change that improves performance",
    "refactor": "A code change that neither fixes a bug nor adds a feature",
    "style": "Changes that do not affect the meaning of the code (e.g. formatting)",
    "test": "Adding missing tests or correcting existing tests",
}


def expand_tabstops(snip):
    commit_type = snip.buffer[snip.line]
    snip.buffer[snip.line] = ""

    snip_body = f"{commit_type}(${{1:<scope>}}): ${{2:<subject>}}\n"
    snip_body += "\n"
    snip_body += f"# {TYPE_DESCRIPTION[commit_type]}\n"
    # snip_body += "\n"
    # snip_body += "${3:<body>}\n"

    snip.expand_anon(snip_body)
