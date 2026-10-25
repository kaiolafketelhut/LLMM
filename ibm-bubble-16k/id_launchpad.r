cd ~/ibm-bubble-16k

# Force git to use the correct key for Launchpad
git config core.sshCommand "ssh -i ~/.ssh/id_launchpad -o IdentitiesOnly=yes"

# Pull and merge any remote history, then push to master and demo
git pull origin master --allow-unrelated-histories --no-rebase
git push -u origin master
git push origin master:demo

