# Automator

This is a directory for workflows made using Mac Automator.

## Services

The `services` directory is used to store a copy of workflows to be used as services. Currently setting up of of these as a service with the OS has to be done manually. Open one of the workflows with Automator and select `File` > `Convert To...` and then select "Service" or "Quick Task" from the menu.

Once setup as a service the workflow will also appear in `~/Library/Services` - in the future we should look at automating this process or symlinking to services in the `.dotfiles` directory.

## Automation

The `automation` directory contains stardard workflows. These can be listed using the `work_list` command, and run using the `work_auto <workflow-name>` command. These are less versatile than services, but are useful for setting up simple tasks like opening a certain set of files.

- \* The `work_list` and `work_auto` commands are defined in the `/zsh/functions.zsh` file.
