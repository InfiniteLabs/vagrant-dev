#!/bin/bash

#
# Script for instalation of php in a vagrant VBox with ubuntu
#
# @author Herberto Graca <herberto.graca@gmail.com>
#
# Version: 1.0.0

# ==================================================================
#
# VARIABLES
#
# ------------------------------------------------------------------

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${DIR}/../settings.sh

# get environment from argument if it exist
if [ $# -ne 0 ]; then
    ENV=$1
fi

DEPENDENCIES=( php )

# ==================================================================
#
# MAIN
#
# ------------------------------------------------------------------


echo
echo "Installing dependencies ... "
echo
install_apps DEPENDENCIES[@]

echo
echo "Installing composer ..."
echo
curl -sS https://getcomposer.org/installer | php -d detect_unicode=Off
echo
echo "Moving composer.phar to /usr/bin/composer ..."
echo
mv composer.phar /usr/bin/composer.phar
echo
echo "Making sure composer is executable ..."
echo
chmod a+rx /usr/bin/composer.phar

/usr/bin/composer.phar global require hirak/prestissimo

echo '
#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f ${DIR}/composer.phar ]; then
    php -d memory_limit=-1 ${DIR}/composer.phar "$@"
else
    php -d memory_limit=-1 composer.phar "$@"
fi
' > /usr/bin/composer
chmod a+rx /usr/bin/composer

exit 0
