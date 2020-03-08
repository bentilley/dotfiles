"""
Helper utilities to format LaTeX snippets.
"""


def get_section(sub_repeats, section_type):
    subs = ""
    if sub_repeats:

        subs = subs.join(len(sub_repeats) * ["sub"])
    section = {"sec": "section", "par": "paragraph"}[section_type]
    return "\\" + subs + section

def get_matching_paren(paren):
    return {"(": ")", "[": "]", "{": "}"}[paren]
