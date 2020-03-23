import os
import re

def get_password(email_addr):
    stream = os.popen("security find-generic-password -a $USER -s " + email_addr + " -w")
    output = stream.read()
    return output.strip()

# print(get_password("tilleyben@hotmail.com"))

def filter_folders(foldername):
    return foldername in ['Inbox', 'Drafts'] or re.search('(^Admin)', foldername)
