"""
Helper utilities to format python snippets.
"""


def comma_if_args(init_args):
    if init_args:
        return ", "
    else:
        return ""


def generate_constructor_body(snip, init_args):
    snip >> 1
    if init_args:
        snip >> 1
        init_args = init_args.replace(" ", "")
        init_args = init_args.split(",")
        for arg in init_args:
            snip += format_arg(arg)
    else:
        snip.rv += snip.mkline("pass")


def format_arg(arg):
    return f"self.{arg} = {arg}"
