SELECT Student.StudentID, Student.FirstName, Student.LastName, COALESCE(AVG(Mark.Value), 0) AS "Average Mark" 
FROM Student
LEFT JOIN Mark ON Student.StudentID = Mark.StudentID
GROUP BY Student.StudentID;