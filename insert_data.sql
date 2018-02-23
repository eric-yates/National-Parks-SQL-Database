# Example for logging a trail hiked

INSERT INTO trails (park_id, trail_name, distance, elevation, duration, rating, visited, visit_date)
VALUES
(146, 'Druid Arch Trail', 11.2, 1654, '5:10:09', 5, 1, '2018-01-18');

# Example for choosing which parks have been visited

UPDATE parks
SET visited = 1
WHERE 
park_id = 8
OR park_id = 15
OR park_id = ...