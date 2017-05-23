
SET @@SESSION.SQL_LOG_BIN=0;

CREATE USER 'sonar'@'%'   IDENTIFIED BY 'sonar';
CREATE USER 'redmine'@'%' IDENTIFIED BY 'redmine';

CREATE DATABASE `sonar`;
CREATE DATABASE `redmine`;

GRANT ALL ON `sonar`.*   TO 'sonar'@'%'   WITH GRANT OPTION;
GRANT ALL ON `redmine`.* TO 'redmine'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
