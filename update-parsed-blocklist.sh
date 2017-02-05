#!/bin/bash
mkdir ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone git@github.com:Dm3Ch/RKN-parsed-blocklist.git --depth 1
cd RKN-parsed-blocklist
wget "https://raw.githubusercontent.com/Dm3Ch/RKN-blocklist-parser/master/parser.rb"
wget "https://api.antizapret.info/all.php?type=xml" -O dump.xml
ruby parser.rb
rm parser.rb dump.xml
git add *
git commit -m "Updated at: $(date -u +"%Y-%m-%d %H:%M:%S %:z")"
git push origin
cd ../
rm -rf RKN-parsed-blocklist