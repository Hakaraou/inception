CREATE DATABASE IF NOT EXISTS wordpress_db;
CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_pass';
CREATE USER IF NOT EXISTS 'superuser42'@'%' IDENTIFIED BY 'super_secure_pass';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'%';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'superuser42'@'%';
FLUSH PRIVILEGES;