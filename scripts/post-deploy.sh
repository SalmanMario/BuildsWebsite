#!/bin/bash
set -e

php artisan key:generate --force
php artisan migrate --force
php artisan storage:link || true
php artisan optimize
