#!/bin/bash

# little bit of checkups
bundle check || bundle install
bundle exec rails about

#little bit of cleanup
PUMA_SERVER_ID=/tmp/server.pid
[ -f $PUMA_SERVER_ID ] && rm -rf $PUMA_SERVER_ID

# starting the server
bundle exec rails db:migrate

#boot the rails server
bundle exec rails s -b 0.0.0.0 -p 3000 -P $PUMA_SERVER_ID

# or boot puma if needby ;)
# bundle exec puma \
#        --pidfile /tmp/pid_puma_$(hostname).pid \
#        --redirect-stdout  /dev/stdout \
#        --redirect-stderr /dev/stderr \
#        --redirect-append

