SELECT Student.FirstName, Student.LastName , (SELECT COUNT(*) FROM Deadline) - COUNT(Deadline.DeadlineID) AS "Pending Midterms/Exams"
FROM Student
LEFT JOIN Mark ON Student.StudentID = Mark.StudentID
LEFT JOIN Deadline ON Mark.DeadlineID = Deadline.DeadlineID
GROUP BY Student.StudentID;