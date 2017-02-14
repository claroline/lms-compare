#!/bin/bash
set -e
# Wait for MySQL to respond, depends on mysql-client
while ! mysqladmin ping -h"chamilo_db" --silent; do
    echo "MySQL is down"
    sleep 1
done
echo "MySQL is up"

echo 'No previous Chamilo install found, Installing...'

mkdir -p web/uploads web/assetic web/bundles web/js web/css app/cache

chmod -R 777 app/config app/logs web/uploads web/assetic web/bundles web/js web/css app/cache
composer install -vvv
echo 'Chamilo has finished installing.'

exec "$@"
