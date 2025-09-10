CREATE DATABASE IF NOT EXISTS tp4;
USE tp4;

CREATE TABLE test (id INT AUTO_INCREMENT, name VARCHAR(45) NOT NULL, PRIMARY KEY (id) );

INSERT INTO test (id, name) VALUES (NULL, 'Alice');
INSERT INTO test (id, name) VALUES (NULL, 'Bob');
INSERT INTO test (id, name) VALUES (NULL, 'Charlie');

