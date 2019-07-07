SET CHARACTER_SET_CLIENT = utf8mb4;
SET CHARACTER_SET_CONNECTION = utf8mb4;

CREATE TABLE `users` (
`username` TEXT NOT NULL,
`password` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `articles` (
`article_key` CHAR(32) NOT NULL UNIQUE,
`created_at` TEXT NOT NULL,
`username` TEXT NOT NULL,
`title` TEXT NOT NULL,
`abstract` TEXT NOT NULL,
`body` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO users VALUES ('admin', 'password_you_cannot_guess');
INSERT INTO articles VALUES ('censored', '2020/00/00 00:00', 'admin', 'flag', 'flag', 'dummy4b{here_comes_flag}');

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'app'@'%';
GRANT SELECT, INSERT ON app.users TO 'app'@'%';
GRANT SELECT, INSERT ON app.articles TO 'app'@'%';
