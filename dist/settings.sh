#!/bin/bash

echo
echo "Setting variables ... "
echo

GIT_USER_NAME='username'
GIT_USER_EMAIL='user-email@videodock.com'
GIT_CORE_EDITOR='nano'

TIMEZONE='Europe/Amsterdam'

PROJECT_NAME='sluged-project-name'
PROJECT_PATH="/var/www/${PROJECT_NAME}"

ENVIRONMENT='dev'
ENV='dev' # This is used in the scripts, to know which scripts to run
APPLICATION_ENV='dev' # This is set as a shell environment variable

XDEBUG_IDE_KEY="PHPSTORM"

MYSQL_ROOT_PASS='xpto'

PHPMYADMIN_ROOT_PASS='xpto'

# This will be set in the guest /etc/hosts file, so the application can run in the guest and use a DB in the host
APP_DB_HOST_IP="127.0.0.1" # replace with "193.168.1.1" to use the DB in the host machine
