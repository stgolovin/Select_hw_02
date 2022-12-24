SELECT g.name, count(a.name)
FROM genre AS g
LEFT JOIN artistsgenres AS ag ON g.id = ag.genre_id
LEFT JOIN artist AS a ON ag.artist_id = a.id
GROUP BY g.name
ORDER BY count(a.id) DESC;

SELECT count(s.name) FROM song AS s
JOIN album ON album.id = s.album_id
WHERE album.year_of_release BETWEEN 2019 AND 2020;

SELECT a.name, avg(duration) FROM song
LEFT JOIN album AS a ON song.album_id  = a.id
GROUP BY a.name
ORDER BY AVG(duration);

SELECT artist.name FROM artist
WHERE artist.name NOT IN (SELECT artist.name FROM artist
JOIN albumsartists AS aa ON aa.artist_id = artist.id 
JOIN album AS a ON a.id = aa.album_id
WHERE a.year_of_release = 2020);

SELECT m.name FROM mixtape AS m
LEFT JOIN mixtapesongs AS ms ON m.id = ms.mix_tape_id
LEFT JOIN song AS s ON s.id = ms.song_id 
LEFT JOIN album AS a ON a.id = s.album_id 
LEFT JOIN albumsartists AS aa ON aa.album_id = a.id 
LEFT JOIN artist AS art ON art.id = aa.artist_id
WHERE art.name LIKE '%Boris%'
ORDER BY m.name;

SELECT alb.name FROM album as alb
LEFT JOIN albumsartists AS aa on alb.id = aa.album_id
LEFT JOIN artist as a on a.id = aa.artist_id
LEFT JOIN artistsgenres as ag on a.id = ag.artist_id
LEFT JOIN genre as g on g.id = ag.genre_id
GROUP BY alb.name
HAVING count(DISTINCT g.name) > 1
ORDER BY alb.name;

SELECT name FROM song AS s
LEFT JOIN mixtapesongs AS mt ON s.id = mt.song_id
WHERE mt.song_id IS NULL;

SELECT a.name, s.duration FROM song AS s
LEFT JOIN album AS alb ON alb.id = s.album_id
LEFT JOIN albumsartists AS aa ON aa.album_id = alb.id
LEFT JOIN artist AS a ON a.id = aa.artist_id
GROUP BY a.name, s.duration
HAVING s.duration = (SELECT min(duration) FROM song);

-- SELECT DISTINCT a.name FROM album AS a
-- LEFT JOIN song as s on s.album_id = a.id
-- WHERE s.album_id IN (
--     SELECT album_id FROM song
--     GROUP BY album_id
--     HAVING count(id) = (
--         SELECT count(id) FROM song
--         GROUP BY album_id
--         ORDER BY count
--         LIMIT 1
--     )
-- )
-- ORDER BY a.name;

SELECT a.name, COUNT(s.name)  FROM album AS a
JOIN song AS s ON a.id = s.album_id 
GROUP BY a.name
HAVING COUNT(s.name) = (
	SELECT COUNT(s.name) FROM album
	JOIN song ON album.id = song.album_id 
	GROUP BY album.name
	ORDER BY COUNT(song.name)
	LIMIT 1);