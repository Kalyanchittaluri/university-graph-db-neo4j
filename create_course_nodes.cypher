CREATE COURSE NODES

LOAD CSV WITH HEADERS
FROM 'file:///Updated Mentor-mentee_Faculty.csv'
AS row

MERGE (c:Course {
    name: row.Course

MATCH (c:Course)
RETURN c.name AS course
ORDER BY course;

MATCH (c:Course)
RETURN count(c) AS totalCourses;
