
#!/bin/bash

echo "----- WordPress Installer -----"

url='sitename.loc'
title='sitename'
admin_user='admin'
admin_password='12345'
admin_email='v.kamuz@gmail.com'
dbname='sitename'
dbuser='root'
dbpass='root'

wp core download --skip-content --force

wp config create --dbname=$dbname --dbuser=$dbuser --dbpass=$dbpass --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );
define('AUTOSAVE_INTERVAL', 360000 );
define('WP_POST_REVISIONS', false );
PHP

wp db create

wp core install --url=$url --title="$title" --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email

wp plugin delete hello akismet

# wp plugin install query-monitor all-in-one-wp-migration generateblocks duplicate-post --activate

# wp theme install generatepress --activate

echo "----- Installation is complete -----"