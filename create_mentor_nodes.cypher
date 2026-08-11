CREATE MENTOR NODES

LOAD CSV WITH HEADERS
FROM 'file:///Updated Mentor-mentee_Faculty.csv'
AS row

MERGE (m:Mentor {
    mentorCode: row.`Mentor Code`

SET
    m.name = row.`Mentor Name`,
    m.email = row.`Mentor Mail Id`;

MATCH (m:Mentor)
RETURN
    m.mentorCode AS mentorCode,
    m.name AS mentorName,
    m.email AS mentorEmail
ORDER BY mentorName;

MATCH (m:Mentor)
RETURN count(m) AS totalMentors;
