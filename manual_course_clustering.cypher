CREATE COURSE CLUSTERS

MATCH (s:Student)-[:`Enrolled In`]->(c:Course)
SET s.courseCluster = c.name;

MATCH (s:Student)
RETURN
    s.courseCluster AS clusterId,
    count(s) AS studentCount
ORDER BY studentCount DESC;

MATCH (s:Student)
WHERE s.courseCluster = 'B.Tech. AE'
RETURN
    s.name AS student,
    s.courseCluster AS clusterId;

MATCH (s:Student)
WHERE
    s.courseCluster = 'B.Tech. AE'
    AND s.name = 'Prateek Gajula'
RETURN s;

MATCH (s:Student)
WHERE s.courseCluster IS NULL
RETURN count(s) AS studentsWithoutCourseCluster;
