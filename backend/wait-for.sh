#!/bin/sh

# wait-for.sh postgres:5432 -- npm run start:prod

set -e

host="$1"
shift

until nc -z $host; do
  echo "Waiting for $host..."
  sleep 2
done

exec "$@"
