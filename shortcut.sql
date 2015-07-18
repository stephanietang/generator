CREATE USER 'devuser'@'localhost' IDENTIFIED BY 'devpwd';

Grant ALL ON *.* TO 'devuser'@'localhost';

##### mysql set utf-8
append following to my.ini/my.cnf
[client]
default-character-set=utf8

[mysql]
default-character-set=utf8

[mysqld]
character-set-server=utf8

in mysql
mysql > show variables like 'char%';

##### change database charset
ALTER TABLE `table` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;


CREATE DATABASE gene
    CHARACTER SET utf8
    COLLATE utf8_unicode_ci;

ALTER DATABASE gene
    CHARACTER SET utf8
    COLLATE utf8_unicode_ci;
    
