#!/bin/bash

# little bit of checkups
bundle check || bundle install
bundle exec rails about

#little bit of cleanup
PUMA_SERVER_ID=tmp/pids/server.pid
[ -f $PUMA_SERVER_ID ] && rm -rf $PUMA_SERVER_ID

# starting the server
bundle exec rails db:migrate
bundle exec rails s -b 0.0.0.0 -p 3000
