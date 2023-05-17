# Idk. Some notes I guess.
I'll probably move this file somewhere else. I just need to make some notes.

## runbook
If himalaya complains about a cert error, I just need to restart dovecot on the server "sudo systsemctl restart dovecot". This is because the cert was probably updated automatically, dovecot still has the old cert cached though.

## 2022-05-17
Using the ".." syntax for git will make the command work with a range. Git rev-list and log will both work with this.

Also, another cool idea I should do... I should make a private clipboard in the cloud. There are a few levels of clipboards:

- application clipboard (yeah)
- user clipboard (store in file accessible to user)
- system clipboard (similar to user, but store in shared folder with right perms, this could be buggy I think)
- cross-system clipboard (idea, probably ssh + file)
- internet clipboard (croc i guess)

This is a cool article, describing how the git hash is calculated: https://gist.github.com/masak/2415865

Kustomize vs Helm:

- Kustomize is built into kubectl. Helm is not.
- Kustomize is like merging/replacing yaml. Helm has its own templating language.
- Kustomize seems more lightweight than helm and easier to read.
