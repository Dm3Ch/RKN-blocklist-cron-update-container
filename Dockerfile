FROM ubuntu:16.04

RUN apt-get update && \
apt-get install -y wget git ruby2.3 ruby2.3-dev bundler zlib1g zlib1g-dev bash && \
wget "https://raw.githubusercontent.com/Dm3Ch/RKN-blocklist-parser/master/Gemfile" && \
bundle install && \
rm -rf /var/lib/apt/lists/* && \
mkdir ~/.ssh && \
ssh-keyscan github.com >> ~/.ssh/known_hosts

COPY update-parsed-blocklist.sh /opt
ENTRYPOINT ["/opt/update-parsed-blocklist.sh"]
