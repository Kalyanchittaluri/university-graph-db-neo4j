MATCH (m:Mentor)<-[:`Guided By`]-(s:Student)
WHERE m.mentorCode = 'MA1'
RETURN
    m.name AS mentor,
    s.name AS student;

MATCH (s:Student)-[:`Enrolled In`]->(c:Course)
WHERE s.name = 'Prateek Gajula'
RETURN
    s.name AS student,
    c.name AS course;

MATCH (s:Student)-[:`Guided By`]->(m:Mentor)
WHERE s.name = 'Prateek Gajula'
RETURN
    s.name AS student,
    m.name AS mentor;

MATCH (s:Student)-[:`Enrolled In`]->(c:Course)
WHERE c.name = 'B.Tech. AE'
RETURN
    s.name AS student,
    c.name AS course;

MATCH (s:Student)
WHERE s.name = 'Prateek Gajula'
OPTIONAL MATCH (s)-[:`Enrolled In`]->(c:Course)
OPTIONAL MATCH (s)-[:`Guided By`]->(m:Mentor)
RETURN
    s.name AS student,
    s.studentId AS studentId,
    c.name AS course,
    m.name AS mentor;

MATCH (s:Student)-[:`Enrolled In`]->(c:Course)
RETURN
    c.name AS course,
    count(s) AS studentCount
ORDER BY studentCount DESC;

MATCH (s:Student)-[:`Guided By`]->(m:Mentor)
RETURN
    m.name AS mentor,
    count(s) AS studentCount
ORDER BY studentCount DESC;
