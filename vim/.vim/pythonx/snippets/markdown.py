"""
Helper utilities to format markdown snippets.
"""


def generate_table(snip, rmatch, cmatch):
    rows = int(rmatch)
    cols = int(cmatch)

    snip.rv = get_row(cols)
    snip += get_title_divide(cols)
    for i in range(rows):
        snip += get_row(cols)
    print(dir(snip))


def get_row(cols):
    row = "|"
    for i in range(cols):
        row += " Val |"
    return row


def get_title_divide(cols):
    row = "|"
    for i in range(cols):
        row += " --- |"
    return row
