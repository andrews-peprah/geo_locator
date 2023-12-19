#!/bin/bash
set -e

# Starting the entrypoint script.
echo "Starting entrypoint script..."

# Remove a potentially pre-existing server.pid for Rails.
if [ -f /ror/tmp/pids/server.pid ]; then
    echo "Removing stale server.pid file."
    rm -f /ror/tmp/pids/server.pid
fi

# Check if the database exists, create it if it doesn't.
echo "Checking for database existence..."
bundle exec rake db:exists || bundle exec rake db:create

# Run database migrations.
echo "Running database migrations..."
bundle exec rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
echo "Executing command: $@"
exec "$@"
