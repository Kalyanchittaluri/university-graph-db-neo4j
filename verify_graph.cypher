MATCH (s:Student)
RETURN count(s) AS studentCount;

MATCH (c:Course)
RETURN count(c) AS courseCount;

MATCH (m:Mentor)
RETURN count(m) AS mentorCount;

MATCH ()-[r]->()
RETURN count(r) AS relationshipCount;

MATCH (:Student)-[r:`Enrolled In`]->(:Course)
RETURN count(r) AS enrolledInRelationships;

MATCH (:Student)-[r:`Guided By`]->(:Mentor)
RETURN count(r) AS guidedByRelationships;

MATCH (s:Student)-[r]-(n)
RETURN s, r, n

MATCH (s:Student)
RETURN
    s.studentId AS studentId,
    s.name AS name,
    s.course AS course,
    s.mentorCode AS mentorCode
