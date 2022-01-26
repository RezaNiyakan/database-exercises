USE codeup_test_db;

SELECT 'ALL albums in your table' AS 'Info';
SELECT name, sales FROM albums;
UPDATE albums SET sales = (sales * 10);

SELECT 'All info from table' AS '';
SELECT * FROM albums;

SELECT 'All albums released before 1980' AS 'Note';
SELECT name FROM albums WHERE release_date < 1980;
UPDATE albums SET release_date = release_date - 100 WHERE release_date < 1980;


SELECT 'REVISED: ALL albums released before 1980' AS '';
SELECT name, release_date FROM albums
WHERE release_date < 1980;

SELECT 'ALL albums by Michael Jackson' AS 'Michael Jackson Albums';
SELECT name FROM albums WHERE artist = 'Michael Jackson';

UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';

SELECT 'REVISED: ALL albums by Peter Jackson' AS '';
SELECT artist, name FROM albums
WHERE artist = 'Peter Jackson';
