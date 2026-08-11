CREATE STUDENT TO COURSE RELATIONSHIPS

MATCH (s:Student)
MATCH (c:Course)
WHERE s.course = c.name

MERGE (s)-[:`Enrolled In`]->(c);

CREATE STUDENT TO MENTOR RELATIONSHIPS

MATCH (s:Student)
MATCH (m:Mentor)
WHERE s.mentorCode = m.mentorCode

MERGE (s)-[:`Guided By`]->(m);

MATCH (s:Student)-[r:`Enrolled In`]->(c:Course)
RETURN
    s.name AS student,
    c.name AS course

MATCH (s:Student)-[r:`Guided By`]->(m:Mentor)
RETURN
    s.name AS student,
    m.name AS mentor

MATCH ()-[r]->()
RETURN count(r) AS totalRelationships;
