<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     'wordpress' );
define( 'DB_USER',     'root' );
define( 'DB_PASSWORD', '' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8mb4' );
define( 'DB_COLLATE', '' );

/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         '>B{=EP@,~BHZ5C~5^l-+0.2n4)6N/n*)^V )@_<q:.~x#~uq]-1u{D{V`ZLf@?U>');
define('SECURE_AUTH_KEY',  '_:ao<cXqG5|02#-Of=@y&-.+,g@9aygEtF%_[^icNy7+u]]6dunI^v%2qC$b!kmv');
define('LOGGED_IN_KEY',    '91^x56Jmax_z?j0&&(]WFjN+r6T,[|gBwWu:mJn]|$~lcKs(+Lf=WmI3JE82+|zz');
define('NONCE_KEY',        ' v|1VXsN0d$zr1Cr|x2c|d8e@KIWJnWQPy6#gwvfM/bB4}[t3-mDJSboxEWvg!,*');
define('AUTH_SALT',        '0*e6gzlt+JkRI0`3fV5A /+ _l5<MP&j946qqUo>jy2w7n0%_&+Q@c6]J^4nch,y');
define('SECURE_AUTH_SALT', 'CjFI1Ta7bzCp6T&nA6R}KH$4PZRGsn94/LZ-vgeO>je}`Yi_w7{8Qc37H;9Q|BWA');
define('LOGGED_IN_SALT',   '-}&aB5<U^I[$;NRYP^w3n1K8*1lc!ac=][E5-2{[|AVp)!E,^G-$+q:Gf~f>AAct');
define('NONCE_SALT',       ';~/-$*|-6%^q0Oi]YOhUy(-0<w>F_?M7&$!DZ5IzO3gDx97Xr0$(_D<f6`s{<(*[');


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');