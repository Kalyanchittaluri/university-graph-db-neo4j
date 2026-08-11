CALL gds.graph.list();

CREATE LOUVAIN GRAPH PROJECTION

CALL gds.graph.project(
    'studentGraph',
    ['Student', 'Course'],
    {
        ENROLLED_IN: {
            type: 'Enrolled In',
            orientation: 'UNDIRECTED'
        }
    }

CALL gds.graph.list('studentGraph')
YIELD
    graphName,
    nodeCount,
    relationshipCount
RETURN
    graphName,
    nodeCount,
    relationshipCount;

CALL gds.louvain.write(
    'studentGraph',
    {
        writeProperty: 'louvainCommunity'
    }

MATCH (s:Student)
RETURN
    s.louvainCommunity AS communityId,
    count(s) AS studentCount
ORDER BY studentCount DESC;

MATCH (s:Student)
RETURN
    s.name AS student,
    s.louvainCommunity AS communityId
ORDER BY communityId, student;

MATCH (s:Student)
WHERE s.louvainCommunity = 0
RETURN
    s.name AS student,
    s.louvainCommunity AS communityId;

CALL gds.graph.drop('studentGraph');
