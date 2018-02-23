# Question: How to get all park names and trails hiked at those parks?

SELECT park_name, trail_name FROM parks A
INNER JOIN trails B ON A.park_id = B.park_id;

# Question: How many national parks are in Washington?
# Answer: 3

SELECT COUNT(*)
FROM parks A
INNER JOIN states B ON A.state_abbr = B.state_abbr
WHERE state_name='Washington' AND park_type='National Park';

# Question: How many total locations are there for each park type?
# Answer: National Forest: 109, National Monument: 83,...
	
SELECT park_type, COUNT(park_type) FROM parks
GROUP BY park_type
ORDER BY count DESC;

# Question: How many total locations are in each state?
# Answer: California: 42, Alaska: 25,...

SELECT state_name, COUNT(*) FROM parks A
INNER JOIN states B ON A.state_abbr = B.state_abbr
GROUP BY state_name
ORDER BY count DESC, state_name;
