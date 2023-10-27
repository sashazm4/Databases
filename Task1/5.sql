SELECT Course.Name, COUNT(Deadline.DeadlineID)
FROM Course
INNER JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID AND Mark.StudentID = 2 
WHERE Mark.Value IS NULL AND Deadline.Date > CURRENT_DATE
GROUP BY Course.Name, Deadline.DeadlineID;
