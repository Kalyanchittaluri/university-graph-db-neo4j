CREATE STUDENT NODES

LOAD CSV WITH HEADERS
FROM 'file:///Updated Mentor-mentee_Faculty.csv'
AS row

MERGE (s:Student {
    studentId: row.`Pin Number`

SET
    s.name = row.`Name of the Student`,
    s.email = row.`Email ID`,
    s.mobile = row.`Student Mobile number`,
    s.applicationNumber = row.`Application Number`,
    s.course = row.Course,
    s.mentorCode = row.`Mentor Code`;

MATCH (s:Student)
RETURN
    s.studentId AS studentId,
    s.name AS studentName,
    s.course AS course,
    s.mentorCode AS mentorCode

MATCH (s:Student)
RETURN count(s) AS totalStudents;
