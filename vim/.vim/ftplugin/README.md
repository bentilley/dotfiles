# Ftpluging Directory

The ftplugin directory is for Vim plugin scripts that are only used for a
specific filetype.

All files ending in .vim in this directory and subdirectories will be sourced
by Vim when it detects the filetype that matches the name of the file or
subdirectory.

If you want to run addition filetype based code, but not replace the
functionality of an existing ftplugin then you can place changes in
`.vim/after/ftplugin` - these override the setting in `ftpluging`, but don't
replace them.
