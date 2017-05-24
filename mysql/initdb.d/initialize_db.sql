
SET @@SESSION.SQL_LOG_BIN=0;

CREATE USER 'sonar'@'%'   IDENTIFIED BY 'sonar';
CREATE USER 'redmine'@'%' IDENTIFIED BY 'redmine';

CREATE DATABASE `sonar`   DEFAULT CHARACTER SET utf8  COLLATE utf8_generate_ci;
CREATE DATABASE `redmine` DEFAULT CHARACTER SET utf8  COLLATE utf8_generate_ci;

GRANT ALL ON `sonar`.*   TO 'sonar'@'%'   WITH GRANT OPTION;
GRANT ALL ON `redmine`.* TO 'redmine'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
