MATCH (s:Student)-[:`Enrolled In`]->(c:Course)
WHERE s.name = 'Prateek Gajula'
RETURN s, c;

MATCH (s:Student)
WHERE
    s.courseCluster = 'B.Tech. AE'
    AND s.name = 'Prateek Gajula'
RETURN s;

MATCH (s:Student)
WHERE
    s.mentorCluster = 'Mr. Maddula Satya Prasad'
RETURN s;

MATCH (s:Student)
WHERE s.louvainCommunity = 0
RETURN s;

PROFILE BEFORE CLUSTERING

PROFILE
MATCH (s:Student)-[:`Enrolled In`]->(c:Course)
WHERE s.name = 'Prateek Gajula'
RETURN s, c;

PROFILE AFTER COURSE CLUSTERING

PROFILE
MATCH (s:Student)
WHERE
    s.courseCluster = 'B.Tech. AE'
    AND s.name = 'Prateek Gajula'
RETURN s;
