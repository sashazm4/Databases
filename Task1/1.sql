SELECT SGroup.Name AS "Group Name", COUNT(Student.StudentID) AS "Number of Students"
FROM SGroup
LEFT JOIN Student ON SGroup.GroupID = Student.GroupID;