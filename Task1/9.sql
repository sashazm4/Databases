SELECT Student.StudentID, Student.FirstName, Student.LastName,COALESCE(Count(Mark.Value), 0) AS "Number of completed exams/midterms" 
FROM Student
LEFT JOIN  Mark ON Student.StudentID = Mark.StudentID
WHERE
Student.StudentID = 5 
GROUP BY Student.StudentID, Student.FirstName, Student.LastName;