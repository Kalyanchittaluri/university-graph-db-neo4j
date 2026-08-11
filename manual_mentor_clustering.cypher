CREATE MENTOR CLUSTERS

MATCH (s:Student)-[:`Guided By`]->(m:Mentor)
SET s.mentorCluster = m.name;

MATCH (s:Student)
RETURN
    s.mentorCluster AS clusterId,
    count(s) AS studentCount
ORDER BY studentCount DESC;

MATCH (s:Student)
WHERE s.mentorCluster = 'Mr. Maddula Satya Prasad'
RETURN
    s.name AS student,
    s.mentorCluster AS clusterId;

MATCH (s:Student)
WHERE
    s.mentorCluster = 'Mr. Maddula Satya Prasad'
    AND s.name = 'Prateek Gajula'
RETURN s;

MATCH (s:Student)
WHERE s.mentorCluster IS NULL
RETURN count(s) AS studentsWithoutMentorCluster;
