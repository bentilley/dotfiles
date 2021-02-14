import platform
import subprocess


def get_password(platform):
    if platform == "Linux":
        return subprocess.run(
            [
                "keyring",
                "get",
                "grip",
                "bentilley",
            ],
            capture_output=True,
        ).stdout.strip()

    if platform == "Darwin":
        return subprocess.run(
            [
                "security",
                "find-generic-password",
                "-a",
                "bentilley",
                "-s",
                "grip@github.com",
                "-w",
            ],
            capture_output=True,
        ).stdout.strip()

    raise Exception("Platform is not recognised!")


USERNAME = "bentilley"
PASSWORD = get_password(platform.system())
