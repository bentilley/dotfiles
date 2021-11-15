import getpass
import subprocess


USER_NAME_MAP = {
    "btilley": "ben-tilley-elw",
    "mrsquee": "bentilley",
}


PW_CMD_MAP = {
    "btilley": ["pass", "show", "github/grip-markdown-elwood-laptop"],
    "mrsquee": [
        "pass",
        "find-generic-password",
        "-a",
        "bentilley",
        "-s",
        "grip@github.com",
        "-w",
    ],
}


def get_password(username):
    command = PW_CMD_MAP[username]
    return subprocess.run(
        command,
        capture_output=True,
    ).stdout.strip()


USERNAME = "bentilley"
USERNAME = USER_NAME_MAP[getpass.getuser()]
PASSWORD = get_password(getpass.getuser())
