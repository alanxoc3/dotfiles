# Idk. My personal runbook i guess
I'll probably move this file somewhere else. I just need to make a note.

If himalaya complains about a cert error, I just need to restart dovecot on the server "sudo systsemctl restart dovecot". This is because the cert was probably updated automatically, dovecot still has the old cert cached though.