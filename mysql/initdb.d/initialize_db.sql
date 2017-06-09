
SET @@SESSION.SQL_LOG_BIN=0;

CREATE USER 'sonar'@'%'     IDENTIFIED BY 'sonar';
CREATE USER 'cattle'@'%'    IDENTIFIED BY 'cattle';
CREATE USER 'redmine'@'%'   IDENTIFIED BY 'redmine';
CREATE USER 'rundeck'@'%'   IDENTIFIED BY 'rundeck';
CREATE USER 'gitbucket'@'%' IDENTIFIEd BY 'gitbucket';

CREATE DATABASE `sonar`     DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `cattle`    DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `redmine`   DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `rundeck`   DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `gitbucket` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL ON `sonar`.*     TO 'sonar'@'%'     WITH GRANT OPTION;
GRANT ALL ON `cattle`.*    TO 'cattle'@'%'    WITH GRANT OPTION;
GRANT ALL ON `redmine`.*   TO 'redmine'@'%'   WITH GRANT OPTION;
GRANT ALL ON `rundeck`.*   TO 'rundeck'@'%'   WITH GRANT OPTION;
GRANT ALL ON `gitbucket`.* TO 'gitbucket'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
