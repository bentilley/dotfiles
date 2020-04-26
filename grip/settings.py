import subprocess

PASSWORD = subprocess.run(
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
