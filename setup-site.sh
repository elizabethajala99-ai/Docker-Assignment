#!/bin/bash

# Simple WordPress Setup for Cloudboosta
echo "🚀 Setting up Cloudboosta WordPress site..."

# Wait for services
echo "⏳ Waiting for services to start..."
sleep 25

echo "📝 Creating WordPress configuration..."

# Create wp-config.php directly in the container
sudo docker-compose exec -T wordpress bash << 'EOF'
cd /var/www/html

# Create wp-config.php if it doesn't exist
if [ ! -f wp-config.php ]; then
cat > wp-config.php << 'WPEOF'
<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'wordpress123');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');

$table_prefix = 'wp_';
define('WP_DEBUG', false);

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
WPEOF

echo "✅ WordPress configuration created!"
fi

# Set proper permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

EOF

echo ""
echo "🎉 Cloudboosta WordPress is ready!"
echo "📍 Visit: http://localhost:8080"
echo "🔧 Complete the 5-minute WordPress setup with:"
echo "   Site Title: Cloudboosta - Leading Cloud Services"
echo "   Username: admin"
echo "   Password: cloudboosta123"
echo "   Email: admin@cloudboosta.com"
echo ""
echo "🎨 After installation: Go to Appearance → Themes"
echo "   and activate 'Cloudboosta Corporate' theme"