"""
Helper utilities to format javascript snippets.
"""


def generate_constructor(base_class, func_args):
    constructor_body_lines = []

    if base_class:
        constructor_body_lines.append("super();")
    if func_args:
        func_args = func_args.replace(" ", "")
        func_args = func_args.split(",")
        constructor_body_lines += [f"this.{arg} = {arg};" for arg in func_args]

    if len(constructor_body_lines) > 0:
        return "\n    ".join(constructor_body_lines)
    else:
        return ""
