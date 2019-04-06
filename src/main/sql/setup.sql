CREATE DATABASE app_db;
CREATE USER 'app_user' IDENTIFIED BY 'UserSecretPassword';
GRANT ALL PRIVILEGES ON app_db.* TO 'app_user'@'%' WITH GRANT OPTION;
CREATE TABLE `notes` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `note` VARCHAR(255) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO `notes` (note) VALUES ('My first note! Ah, I remember it well.');
INSERT INTO `notes` (note) VALUES ('A hotdog is a sandwich.');
INSERT INTO `notes` (note) VALUES ('Dear Diary: skipped over a nope rope and petted a floof.');
INSERT INTO `notes` (note) VALUES ('The Cake is a LIE!');
INSERT INTO `notes` (note) VALUES ('Dear Diary: So many things have happened since my first note. How naive I was then!');