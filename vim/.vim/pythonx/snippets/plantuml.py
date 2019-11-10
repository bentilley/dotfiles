NOTE_TYPE = {"o": "over", "r": "right of", "l": "left of"}


class Note:
    def __init__(self):
        pass

    def get_type(self, match):
        return NOTE_TYPE[match.group(1)]

    def get_oneline(self, match):
        return " : " if not match.group(2) else ""

    def get_block_close(self, match):
        return "end note" if match.group(2) == "b" else ""

    def get_note_indent(self, match):
        return "  " if match.group(2) == "b" else ""


note = Note()
