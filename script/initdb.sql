DROP DATABASE IF EXISTS hockey;
CREATE DATABASE hockey;
USE hockey;

CREATE TABLE teams(
  teamId VARCHAR(3) PRIMARY KEY NOT NULL,
  city VARCHAR(32) NOT NULL,
  teamName VARCHAR(32) NOT NULL
);
INSERT INTO teams(teamId, city, teamName)
VALUES
  ('pit', 'Pittsburgh', 'Penguins'),
  ('tor', 'Toronto', 'Maple Leafs'),
  ('edm', 'Edmonton', 'Oilers')
  ;

CREATE TABLE player_stats(
  playerId INT AUTO_INCREMENT PRIMARY KEY,
  teamId VARCHAR(3),
  CONSTRAINT fk_team FOREIGN KEY (teamId) REFERENCES teams(teamId), 
  firstName VARCHAR(32) NOT NULL,
  lastName VARCHAR(32) NOT NULL,
  goals INT,
  assists INT,
  pim INT,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO player_stats(
  teamId, firstName, lastName, goals, assists, pim)
VALUES
  ('pit', 'Sidney', 'Crosby', 16, 31, 15),
  ('tor', 'Auston', 'Matthews', 47, 33, 8),
  ('edm', 'Leon', 'Draisaitl', 43, 67, 18),
  ('edm', 'Connor', 'McDavid', 34, 63, 28)
  ;